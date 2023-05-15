select * from {{
    metrics.calculate(
        metric('total_cost'),dimensions = ['ProductName','currency']
    )
}}