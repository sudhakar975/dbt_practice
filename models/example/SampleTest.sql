with CTE AS (

SELECT 

"Loan_ID",
to_timestamp("effective_date"),
dayname("due_date") as day,

case when dayname("due_date") in ('sun', 'sat') then 'weekend' else 'weekdays' end as day_type

FROM {{ source('demo', 'LOAN_PAYMENT') }}
where "past_due_days" IS NOT NULL
)

SELECT * from CTE