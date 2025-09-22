-- This script contains SQL queries for retail data analysis,
-- optimized for a MySQL database.

-- Data Definition Language (DDL)

-- The PRIMARY keyword in PostgreSQL is PRIMARY KEY in MySQL.
CREATE TABLE retail_sales(
transactions_id INT PRIMARY KEY,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(15),
age INT,
category VARCHAR(25),
quantity INT,
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT
);

-- Data Manipulation Language (DML) and Data Exploration

-- Looking at the table data
SELECT * FROM retail_sales;

-- Checking the total entries
SELECT COUNT(*) FROM retail_sales;

-- Searching for rows with NULL data
SELECT * FROM retail_sales
WHERE
transactions_id IS NULL OR
sale_date IS NULL OR
sale_time IS NULL OR
gender IS NULL OR
category IS NULL OR
quantity IS NULL OR
cogs IS NULL OR
total_sale IS NULL;

-- Data Cleaning : Deleting the rows containing NULL data
DELETE FROM retail_sales
WHERE
transactions_id IS NULL OR
sale_date IS NULL OR
sale_time IS NULL OR
gender IS NULL OR
category IS NULL OR
quantity IS NULL OR
cogs IS NULL OR
total_sale IS NULL;

-- Checking the total entries after deletion
SELECT COUNT(*) FROM retail_sales;

-- Data Exploration --

-- How many sales do we have?
SELECT COUNT(*) AS total_sale FROM retail_sales;

-- How many unique customers do we have?
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM retail_sales;

-- How many unique categories do we have?
SELECT DISTINCT category FROM retail_sales;

-- Data Analysis or Business Key Problems & Answers

-- Q1. Write a SQL query to retrieve all columns for sales made on '2022-11-05'.
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022.
-- MySQL uses DATE_FORMAT() instead of PostgreSQL's TO_CHAR().
SELECT *
FROM retail_sales
WHERE category = 'Clothing' AND
DATE_FORMAT(sale_date, '%Y-%m') = '2022-11' AND
quantity >= 4;

-- Q3. Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category,
SUM(total_sale) AS net_sale,
COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- Q4. Write a SQL query to find the average age of the customers who purchased items from the 'Beauty' category.
SELECT ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- Q5. Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Q6. Write a SQL query to find the total number of transactions (transacstion_id) made by each gender in each category.
SELECT category, gender, COUNT(transactions_id) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

-- Q7. Write a SQL query to calculate the average sale for each month. Find out the best-selling month in each year.
-- This query uses the RANK() window function, which requires MySQL 8.0+.
SELECT year, month, avg_sale
FROM (
SELECT YEAR(sale_date) AS year,
MONTH(sale_date) AS month,
AVG(total_sale) AS avg_sale,
RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS ranking
FROM retail_sales
GROUP BY year, month
) AS t1
WHERE ranking = 1;

-- Q8. Write a SQL query to find the top 5 customers based on the highest total sales.
SELECT customer_id,
SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Q9. Write a SQL query to find the unique customers who purchased items from each category.
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- Q10. Write a SQL query to create each shift and the number of orders.
-- This query uses a CTE (WITH clause), which requires MySQL 8.0+.
WITH hourly_sales AS (
SELECT *,
CASE
WHEN HOUR(sale_time) < 12 THEN 'Morning'
WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
ELSE 'Evening'
END AS shift
FROM retail_sales
)
SELECT
shift,
COUNT(*) AS total_orders
FROM hourly_sales
GROUP BY shift;

-- END OF PROJECT