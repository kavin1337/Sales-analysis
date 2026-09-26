
DROP TABLE IF EXISTS pizza_staging;

CREATE TABLE pizza (
    pizza_id VARCHAR(50),
    order_id VARCHAR(50),
    pizza_name_id VARCHAR(100),
    quantity VARCHAR(50),
    order_date VARCHAR(50),
    order_time VARCHAR(50),
    unit_price VARCHAR(50),
    total_price VARCHAR(50),
    pizza_size VARCHAR(50),
    pizza_category VARCHAR(100),
    pizza_ingredients VARCHAR(1000),
    pizza_name VARCHAR(500)
);

BULK INSERT pizza
FROM 'C:\Users\Kavin\Downloads\pizza_sales.csv'
WITH (
    FORMAT = 'CSV',
    FIELDQUOTE = '"',
    FIRSTROW = 2,
    ROWTERMINATOR = '0x0a'
);

ALTER TABLE pizza
ALTER COLUMN pizza_id INT;

ALTER TABLE pizza
ALTER COLUMN order_id INT;

ALTER TABLE pizza
ALTER COLUMN pizza_id INT;


ALTER TABLE pizza
ALTER COLUMN pizza_name_id VARCHAR(30);

ALTER TABLE pizza
ALTER COLUMN quantity INT;

ALTER TABLE pizza
ALTER COLUMN order_date DATE;

SELECT TRY_CONVERT(DATE, order_date, 105)
FROM pizza;


ALTER TABLE pizza
ALTER COLUMN order_time TIME;

ALTER TABLE pizza
ALTER COLUMN unit_price DECIMAL(8,2);

ALTER TABLE pizza
ALTER COLUMN total_price DECIMAL(8,2);

ALTER TABLE pizza
ALTER COLUMN pizza_size VARCHAR(10);

ALTER TABLE pizza
ALTER COLUMN pizza_category VARCHAR(30);

ALTER TABLE pizza
ALTER COLUMN pizza_ingredients VARCHAR(500);

ALTER TABLE pizza
ALTER COLUMN pizza_name VARCHAR(100);

SELECT SUM(total_price) AS total_revenue
FROM pizza;


SELECT ROUND(SUM(total_price)/COUNT(DISTINCT order_id),2) AS Avg_order_value
FROM pizza;

SELECT TOP 5 *
FROM pizza;

SELECT SUM(quantity) AS total_pizza_sold
FROM pizza;

SELECT COUNT(DISTINCT order_id) AS total_order
FROM pizza;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order
FROM pizza;

SELECT DATENAME(weekday, order_date) AS week_day ,
    COUNT(DISTINCT order_id)
FROM pizza
GROUP BY DATENAME(weekday, order_date);

SELECT pizza_id, order_date
FROM pizza
WHERE TRY_CONVERT(DATE, order_date, 105) IS NULL;

ALTER TABLE pizza
ALTER COLUMN order_date DATE;

USE project bi


select convert(date, order_date, 105) FROM pizza;
