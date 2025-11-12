WITH raw_orders AS (
  /* One record per order (consisting of one or more order items) */
  SELECT
    *
  FROM {{ source('ecom', 'raw_orders') }}
), projection AS (
  SELECT
    *
    RENAME (ID AS order_id, CUSTOMER AS customer_id)
  FROM raw_orders
), staging_orders_sql AS (
  SELECT
    *
  FROM projection
)
SELECT
  *
FROM staging_orders_sql