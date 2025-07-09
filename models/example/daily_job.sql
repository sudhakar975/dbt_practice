with daily_job as (

    select CUSTOMERID,
    DATE(DOB) as DOB,
    city
     from {{ source('demo', 'CUSTOMER_DATA') }}

    limit 10
),

city_agg_job as (

    select CUSTOMERID,
    DOB,
    city,
    count(*)

    from daily_job group by CUSTOMERID,     DOB,     city
)
select * from city_agg_job