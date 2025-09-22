# MySQL_Project_Retail_Sales_Analysis

# Retail Sales SQL Analysis Project

This project demonstrates **retail sales data analysis** using **SQL on a MySQL database**.  
It covers **data definition, data cleaning, exploration, and business-driven analysis queries**, making it useful for practice in SQL and real-world retail analytics.

---

## 📂 Project Structure
- **DDL (Data Definition Language):** Creates the `retail_sales` table.  
- **DML (Data Manipulation Language):** Inserts, checks, and removes invalid data.  
- **Data Exploration:** Basic queries to understand the dataset (counts, unique values, NULL checks).  
- **Business Analysis Queries (Q1–Q10):** Analytical SQL queries that answer common retail business questions.

---

## 🛠️ Technologies Used
- **SQL (MySQL 8.0+)**
- **RANK() Window Function** and **CTEs** are used (require MySQL 8.0+)
- **DATE_FORMAT()** for date-based analysis

---

## 📊 Data Dictionary
The project uses the `retail_sales` table with the following columns:

| Column          | Type        | Description                               |
|-----------------|------------|-------------------------------------------|
| transactions_id | INT        | Unique transaction identifier             |
| sale_date       | DATE       | Date of the sale                          |
| sale_time       | TIME       | Time of the sale                          |
| customer_id     | INT        | Unique customer identifier                |
| gender          | VARCHAR    | Gender of the customer                    |
| age             | INT        | Age of the customer                       |
| category        | VARCHAR    | Product category (e.g., Clothing, Beauty) |
| quantity        | INT        | Number of items purchased                 |
| price_per_unit  | FLOAT      | Price per unit item                       |
| cogs            | FLOAT      | Cost of goods sold                        |
| total_sale      | FLOAT      | Final bill amount                         |

---

## 🔍 SQL Analysis Queries
Here are the **key business insights explored in this project**:

- **Q1:** Retrieve sales made on a specific date (`2022-11-05`).  
- **Q2:** Identify clothing sales with quantity ≥ 4 in November 2022.  
- **Q3:** Calculate total sales and number of orders for each category.  
- **Q4:** Find the average age of customers purchasing from the "Beauty" category.  
- **Q5:** Retrieve high-value transactions (total sales > 1000).  
- **Q6:** Determine total transactions by each gender per category.  
- **Q7:** Compute monthly average sales and find the **best-selling month per year**.  
- **Q8:** Find the **Top 5 customers** with the highest sales.  
- **Q9:** Count unique customers for each category.  
- **Q10:** Classify orders into **Morning, Afternoon, Evening shifts** and count them.  

---

## 📈 Example Use Cases
- For **business owners**: Identify best-selling months, customer demographics, and high-value customers.  
- For **data analysts**: Practice **SQL joins, grouping, CTEs, and window functions**.  
- For **students**: Learn how to structure SQL projects for portfolios and GitHub.

---

## 🚀 How to Run
1. Create a MySQL database (version 8.0+ recommended).  
2. Run the script from the SQL file in this repository.  
3. Explore and modify queries as needed for custom insights.

---

## 📌 Key Learnings
- Data cleaning using DELETE with multiple NULL checks.  
- Using **aggregation functions** (`SUM`, `AVG`, `COUNT`).  
- Using **window functions** (`RANK()`).  
- Categorizing data using **CASE WHEN** conditions for business insights.  

---
