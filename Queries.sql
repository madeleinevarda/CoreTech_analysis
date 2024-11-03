-- What were the order counts, sales, and AOV for Macbooks sold in North America for each quarter across all years?

SELECT
  EXTRACT(QUARTER FROM orders.purchase_ts) AS quarter,
  ROUND((COUNT(DISTINCT orders.id)),2) AS order_count, 
  ROUND((SUM(usd_price)),2) AS total_sales, 
  ROUND((AVG(usd_price)/COUNT(orders.id)),2) AS aov
FROM core.orders 
LEFT JOIN core.customers 
  ON orders.customer_id = customers.id 
LEFT JOIN core.geo_lookup
  ON geo_lookup.country_code = customers.country_code
WHERE LOWER(product_name) LIKE '%macbook%'
  AND region = 'NA'
GROUP BY 1
ORDER BY 1;

-- What is the average quarterly order count and total sales for Macbooks sold in North America?

WITH quarterly_metrics AS (
SELECT 
  EXTRACT(QUARTER FROM purchase_ts) AS quarter, 
  COUNT(DISTINCT orders.id) AS order_count, 
  ROUND(SUM(usd_price),2) AS total_sales 
FROM core.orders 
LEFT JOIN core.customers
  ON orders.customer_id = customers.id 
LEFT JOIN core.geo_lookup 
  ON geo_lookup.country_code = customers.country_code
WHERE LOWER(product_name) LIKE '%macbook%'
  AND region = 'NA'
GROUP BY 1
ORDER BY 1)
SELECT 
  quarter, 
  AVG(order_count) AS avg_quarter_orders,
  AVG(total_sales) AS avg_quarter_sales
FROM quarterly_metrics
GROUP BY 1
ORDER BY 1;

-- For products purchased in 2022 on the website or products purchased on mobile in any year, which region has the average highest time to deliver?

SELECT 
  region,
  ROUND(AVG(DATE_DIFF(delivery_ts, orders.purchase_ts, day)),2) AS time_to_deliver
FROM core.orders
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id 
LEFT JOIN core.customers 
  ON customers.id = orders.customer_id
LEFT JOIN core.geo_lookup 
  ON geo_lookup.country_code = customers.country_code
WHERE (EXTRACT(YEAR FROM orders.purchase_ts) = 2022 AND purchase_platform = 'website')
  OR purchase_platform = 'mobile_app'
GROUP BY 1
ORDER BY 2 DESC;

-- For website purchases made in 2022 or Samsung purchases made in 2021 expressing time to deliver in weeks instead of days. Which region had the highest time to delivery?

SELECT 
  region,
  ROUND(AVG(DATE_DIFF(delivery_ts, orders.purchase_ts, week)),2) AS time_to_deliver
FROM core.orders
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id 
LEFT JOIN core.customers
  ON customers.id = orders.customer_id
LEFT JOIN core.geo_lookup
  ON geo_lookup.country_code = customers.country_code
WHERE (EXTRACT(YEAR FROM orders.purchase_ts) = 2022 AND purchase_platform = 'website')
  OR (EXTRACT(YEAR FROM orders.purchase_ts) = 2021 AND lower(product_name) LIKE '%samsung%')
GROUP BY 1
ORDER BY 2 DESC;

-- What was the refund rate and refund count for each product overall? 

SELECT 
  CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '24in 4k gaming monitor'     
   ELSE product_name END AS product_cleaned,
  SUM(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refunds, 
  ROUND(AVG(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END),2) *100 AS refund_rate
FROM core.orders
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id 
GROUP BY 1
ORDER BY 3 DESC;

-- What was the refund rate and refund count for each product per year? 

SELECT 
  EXTRACT(YEAR FROM orders.purchase_ts) AS year,
  CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '24in 4k gaming monitor'     
   ELSE product_name END AS product_cleaned,
  SUM(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refunds, 
  ROUND(AVG(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END),2) *100 AS refund_rate
FROM core.orders
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id 
GROUP BY 1,2
ORDER BY 1 DESC;

-- Within each region, what is the most popular product?

WITH sales_by_product AS
(
SELECT 
  region, 
  CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '24in 4k gaming monitor'     
   ELSE product_name END AS product_name, 
  COUNT(DISTINCT orders.id) AS total_orders,
  RANK() OVER(PARTITION BY region ORDER BY COUNT(orders.id) DESC) AS ranking
FROM core.orders
LEFT JOIN core.customers 
  ON orders.customer_id = customers.id 
LEFT JOIN core.geo_lookup
  ON customers.country_code = geo_lookup.country_code
GROUP BY 1,2)
SELECT 
  region, 
  product_name,
  MAX(total_orders) AS max_orders
FROM sales_by_product
WHERE  ranking =1
GROUP BY 1,2;

-- How does the time to make a purchase differ between loyalty customers vs. non-loyalty customers?

SELECT 
  customers.loyalty_program, 
  ROUND(AVG(DATE_DIFF(order_status.purchase_ts, customers.created_on, day)), 1) AS days_to_purchase, 
  ROUND(AVG(DATE_DIFF(order_status.purchase_ts, customers.created_on, month)), 1) AS months_to_purchase 
FROM 
  core.customers 
LEFT JOIN 
  core.orders
  ON customers.id = orders.customer_id 
LEFT JOIN 
  core.order_status
  ON order_status.order_id = orders.id 
GROUP BY 
    1;

-- Find the time to purchase per loyalty program and per purchase platform. Return the number of records to benchmark the severity of nulls.


SELECT 
  customers.loyalty_program, 
  purchase_platform,
  ROUND(AVG(DATE_DIFF(order_status.purchase_ts, customers.created_on, day)), 1) AS days_to_purchase, 
  ROUND(AVG(DATE_DIFF(order_status.purchase_ts, customers.created_on, month)), 1) AS months_to_purchase, 
  COUNT(*) AS row_count
FROM 
  core.customers
JOIN 
  core.orders
  ON customers.id = orders.customer_id 
JOIN 
  core.order_status 
  ON order_status.order_id = orders.id 
GROUP BY 
  1,2;



