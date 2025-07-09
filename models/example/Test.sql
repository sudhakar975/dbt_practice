select * from {{ source('demo', 'LOAN_PAYMENT') }}
limit 100