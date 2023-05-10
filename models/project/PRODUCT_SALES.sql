{{ config(materialized='table',schema='analytics') }}

Select A.ProductID,A.ProductName,A.Category,SUM(B.Units) AS Units, SUM(B.sale_price) AS SalePrice,B.currency FROM {{ref('DIM_PRODUCT')}} AS A
LEFT JOIN dbt_ihba02_raw_data.order_details AS B ON A.ProductID==B.product_id
GROUP BY A.ProductID,A.ProductName,A.Category,B.currency