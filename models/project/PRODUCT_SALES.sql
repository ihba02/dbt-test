{{ config(materialized="table", schema="analytics") }}

select
    a.productid,
    a.productname,
    a.category,
    sum(b.units) as units,
    sum(b.sale_price)  as saleprice,
    b.currency
from {{ ref("DIM_PRODUCT") }} as a
left join dbt_ihba02_raw_data.order_details as b on a.productid == b.product_id
group by a.productid, a.productname, a.category, b.currency
