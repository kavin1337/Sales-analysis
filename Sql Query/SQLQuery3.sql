SELECT TOP (1000) [pizza_id]
      ,[order_id]
      ,[pizza_name_id]
      ,[quantity]
      ,[order_date]
      ,[order_time]
      ,[unit_price]
      ,[total_price]
      ,[pizza_size]
      ,[pizza_category]
      ,[pizza_ingredients]
      ,[pizza_name]
  FROM [project bi].[dbo].[pizza]

SELECT TOP (100) [order_date]
FROM pizza;


select convert(date, order_date, 105)as order_day
FROM pizza;

SELECT *
FROM pizza;

SELECT order_date,
       TRY_CONVERT(DATE, order_date, 105) AS converted_date
FROM pizza;

ALTER TABLE pizza
ALTER COLUMN order_date DATE;

SELECT pizza_id, order_date
FROM pizza
WHERE TRY_CONVERT(DATE, order_date, 105) IS NULL
  AND order_date IS NOT NULL;

ALTER TABLE pizza
ADD new_order_date DATE;

UPDATE pizza
SET new_order_date = TRY_CONVERT(DATE, order_date, 105);

SELECT pizza_id, order_date, new_order_date
FROM pizza;

ALTER TABLE pizza
DROP COLUMN order_date;

EXEC sp_rename 'pizza.new_order_date', 'order_date', 'COLUMN';


SELECT DATENAME(WEEKDAY, order_date) AS weekday,
    COUNT(DISTINCT order_id) AS cnt
FROM pizza
GROUP BY DATENAME(WEEKDAY, order_date)

SELECT DATENAME(MONTH, order_date) AS weekday,
    COUNT(DISTINCT order_id) AS cnt
FROM pizza
GROUP BY DATENAME(MONTH, order_date)

SELECT 
    pizza_category, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS revenue,
    CAST(SUM(total_price) *100/ (SELECT SUM(total_price) FROM pizza) AS DECIMAL(8,2)) AS per_cat
FROM pizza
GROUP BY pizza_category;

SELECT 
    pizza_size, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS revenue,
    CAST(SUM(total_price) *100/ (SELECT SUM(total_price) FROM pizza) AS DECIMAL(8,2)) AS per_cat
FROM pizza
GROUP BY pizza_size
ORDER BY revenue DESC;

SELECT 
    pizza_category, 
    CAST(SUM(quantity) AS DECIMAL(10,2)) AS quant,
    CAST(SUM(quantity) *100/ (SELECT SUM(quantity) FROM pizza) AS DECIMAL(8,2)) AS per_cat
FROM pizza
GROUP BY pizza_category
ORDER BY quant DESC;

SELECT TOP 5
    pizza_name,
    SUM(total_price) AS revenue
FROM pizza
GROUP BY pizza_name
ORDER BY revenue DESC;

SELECT TOP 5
    pizza_name,
    SUM(total_price) AS revenue
FROM pizza
GROUP BY pizza_name
ORDER BY revenue ;

SELECT TOP 5
    pizza_name,
    SUM(quantity) AS revenue
FROM pizza
GROUP BY pizza_name
ORDER BY revenue DESC;

SELECT TOP 5
    pizza_name,
    SUM(quantity) AS revenue
FROM pizza
GROUP BY pizza_name
ORDER BY revenue;


SELECT TOP 5
    pizza_name,
    COUNT(DISTINCT order_id) AS revenue
FROM pizza
GROUP BY pizza_name
ORDER BY revenue DESC;

SELECT TOP 5
    pizza_name,
    COUNT(DISTINCT order_id) AS revenue
FROM pizza
GROUP BY pizza_name
ORDER BY revenue;

SELECT *
FROM pizza;
