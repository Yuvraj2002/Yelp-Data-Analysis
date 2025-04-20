create or replace table yelp_reviews(reviews_text variant)

copy into yelp_reviews
from 's3://yelpdataanalysis/yelp-reviews/'
credentials = (
AWS_KEY_ID='AKIAW3MEBVHXMECOTOWB'
AWS_SECRET_KEY='1GnGsqQXDUNsrYS3lLWFlQ00scjO9ecLjUpjPfnS'
)
file_format=(type=json)

create or replace table table_yelp_reviews as 
select reviews_text:business_id::string as business_id,
reviews_text:date::date as review_date,
reviews_text:stars::number as stars,
reviews_text:text::string as review_text,
analyse_sentiment(reviews_text) as sentiment,
from yelp_reviews
