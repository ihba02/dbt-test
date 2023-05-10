{{ config(materialized='incremental',sort='customer_id', dist='customer_id',schema='staging') }}

select customer_id AS CustomerID 
from dbt_ihba02_raw_data.customer_details
