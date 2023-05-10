{{ config(materialized='incremental', sort='code', dist='code',schema='staging') }}

Select code as ProductID, 
name as ProductName,
Category 
From dbt_ihba02_raw_data.products_details 
Where code is not null

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  --where code NOT IN (select code from {{ this }})

{% endif %}