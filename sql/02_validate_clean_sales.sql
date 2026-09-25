-- Validate cleaned sales data

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT order_id) AS unique_orders,
  COUNTIF(quantity <= 0) AS invalid_quantities,
  COUNTIF(category IS NULL) AS null_categories,
  COUNTIF(payment_method IS NULL) AS null_payment_methods,
  ROUND(SUM(total_sales), 2) AS total_revenue
FROM `e-commerce-elt-pipeline-509716.ecommerce.clean_sales`;


-- Revenue by category validation

SELECT
  category,
  COUNT(*) AS orders,
  ROUND(SUM(total_sales), 2) AS revenue
FROM `e-commerce-elt-pipeline-509716.ecommerce.clean_sales`
GROUP BY category
ORDER BY revenue DESC;
