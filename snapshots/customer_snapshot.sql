{% snapshot customer_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='CustomerId',

      strategy='timestamp',
      updated_at='SubscriptionDate',
    )
}}

select * from dbt_ihba02_Analytics.customer

{% endsnapshot %}