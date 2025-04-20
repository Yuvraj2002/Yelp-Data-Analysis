create or replace table yelp_businesses(business_text variant)

copy into yelp_businesses
from 's3://yelpdataanalysis/yelp_academic_dataset_business.json'
credentials = (
AWS_KEY_ID='AKIAW3MEBVHXMECOTOWB'
AWS_SECRET_KEY='1GnGsqQXDUNsrYS3lLWFlQ00scjO9ecLjUpjPfnS'
)
file_format=(type=json)

create or replace table table_yelp_businesses as 
select business_text:business_id::string as business_id,
business_text:city::string as city,
business_text:state::string as state,
business_text:review_count::number as review_count,
business_text:stars::number as stars,
business_text:categories::string as categories,
from yelp_businesses
