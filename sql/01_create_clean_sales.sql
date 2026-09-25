CREATE OR REPLACE TABLE
  `e-commerce-elt-pipeline-509716.ecommerce.clean_sales` AS

WITH cleaned AS (
  SELECT
    order_id,
    order_date,

    COALESCE(
      NULLIF(TRIM(customer_id), ''),
      'Unknown'
    ) AS customer_id,

    TRIM(product) AS product,

    COALESCE(
      NULLIF(INITCAP(TRIM(category)), ''),
      'Unknown'
    ) AS category,

    quantity,
    unit_price,

    TRIM(region) AS region,

    COALESCE(
      NULLIF(TRIM(payment_method), ''),
      'Unknown'
    ) AS payment_method,

    quantity * unit_price AS total_sales,

    ROW_NUMBER() OVER (
      PARTITION BY order_id
      ORDER BY order_date
    ) AS row_num

  FROM `e-commerce-elt-pipeline-509716.ecommerce.raw_sales`

  WHERE quantity > 0
)

SELECT
  order_id,
  order_date,
  customer_id,
  product,
  category,
  quantity,
  unit_price,
  region,
  payment_method,
  total_sales

FROM cleaned

WHERE row_num = 1;
