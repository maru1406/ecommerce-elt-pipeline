-- E-Commerce ELT Pipeline
-- Step 3: Create analytics views

-- Monthly sales performance
CREATE OR REPLACE VIEW
  `e-commerce-elt-pipeline-509716.ecommerce.v_monthly_sales` AS

SELECT
  DATE_TRUNC(order_date, MONTH) AS month,
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(quantity) AS units_sold,
  ROUND(SUM(total_sales), 2) AS revenue,
  ROUND(AVG(total_sales), 2) AS average_order_value
FROM `e-commerce-elt-pipeline-509716.ecommerce.clean_sales`
GROUP BY month;


-- Category performance
CREATE OR REPLACE VIEW
  `e-commerce-elt-pipeline-509716.ecommerce.v_category_sales` AS

SELECT
  category,
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(quantity) AS units_sold,
  ROUND(SUM(total_sales), 2) AS revenue,
  ROUND(AVG(total_sales), 2) AS average_order_value
FROM `e-commerce-elt-pipeline-509716.ecommerce.clean_sales`
GROUP BY category;


-- Regional performance
CREATE OR REPLACE VIEW
  `e-commerce-elt-pipeline-509716.ecommerce.v_region_sales` AS

SELECT
  region,
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(quantity) AS units_sold,
  ROUND(SUM(total_sales), 2) AS revenue,
  ROUND(AVG(total_sales), 2) AS average_order_value
FROM `e-commerce-elt-pipeline-509716.ecommerce.clean_sales`
GROUP BY region;


-- Product performance
CREATE OR REPLACE VIEW
  `e-commerce-elt-pipeline-509716.ecommerce.v_product_sales` AS

SELECT
  product,
  category,
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(quantity) AS units_sold,
  ROUND(SUM(total_sales), 2) AS revenue,
  ROUND(AVG(total_sales), 2) AS average_order_value
FROM `e-commerce-elt-pipeline-509716.ecommerce.clean_sales`
GROUP BY product, category;
