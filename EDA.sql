--#1 Find the most popular categories of business (based on number of reviews)
with cte as (
select business_id, trim(A.value) as category 
from table_yelp_businesses,
lateral split_to_table(categories,',') A
)
select category, count(*) as no_of_reviews
from cte
inner join table_yelp_reviews r on cte.business_id=r.business_id
group by 1
order by 2 desc

--#2 Top 3 most recent reviews for each business
with cte as(
select r.*, b.business_id
 , row_number() over(partition by r.business_id order by review_date desc) as rn
from table_yelp_reviews r inner join table_yelp_businesses b on r.business_id=b.business_id
)
select * from cte where rn<=3

--#3 Find the percentage of 5-star reviews for each business 
select b.business_id, count(*) as total_reviews,
sum(case when r.stars=5 then 1 else 0 end) as star5_reviews, 
star5_reviews*100/total_reviews as percent5star
from table_yelp_reviews r inner join table_yelp_businesses b on r.business_id=b.business_id group by b.business_id

--#4 Find top 5 most reviewed businesses in each city
with cte as (
select b.city, b.business_id, count(*) as total_reviews
from table_yelp_reviews r inner join table_yelp_businesses b on r.business_id=b.business_id
group by 1,2
)
select * from cte qualify row_number() over(partition by city order by total_reviews desc)<=5

--#5 Find top 10 businesses with highest positive sentiment reviews 
select r.business_id, count(*) as total_reviews from table_yelp_reviews as r
where sentiment='Positive'
group by 1
order by 2 desc
limit 10
