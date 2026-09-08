# SQL-CRUD-demonstration-with-data-analysis-and-PowerBI

The goal of this repository is to demonstrate the full process of database creation, database extracting and then data visualising.  This is done by demonstrating every SQL CRUD operation, querying the database with robust SELECT commands and using the data to fuel an interactive Power BI dashboard. The dashboard is designed to highlight the revenue and product trends of a fictional beauty products company and its different fictional branches, 'skincare' products show a strong upward trend. 

![alt text](<Dashboard Slicers Demonstration.gif>)

Data analysis is most evident in the 'SQL data analysis.sql' file where a robust SELECT command uses a CTE, JOINs, GROUP BYs, CASE WHEN and more to calculate the spending habits of different customers and rank them into value categories. The result of this SELECT command is visible as 'table_data_analysis_result.csv'

# -'1 - SQL CRUD retail data Creation'-
'CREATE' file makes tables and their relevant foreign keys. MANY products can be sold by MANY branches at different prices so a MANY - MANY table is used to establish prduct_price.

'INSERT' file populates the tables. 'orders' data is ai generated, ai was handed schema and expected data trends for me to populate 'orders' table with.

'UPDATE - DELETE - READ' file makes a new category for select existing products, updates the name of a payment type and deletes incomplete orders. 
An important SELECT command is used to pull a table of all orders information with an additional column that calculates the value of each order by JOINing to the product_price table. The new table is called 'orders_with_values' and is a crucial step for the revenue calculations that are later done in Power BI.

# -'2 - Retail data as CSV'-
This folder holds all the tables made by the previous CRUD operations, exported as CSV.

# -'3 - Power BI code and visuals'-
The tables 'orders_with_values', 'customers', 'products' and 'branches' are put into Power BI and connected with an appropriate STAR SCHEMA.
'DAX code used' file shows a series of measures performed using DAX code, most notably two CALCULATE commands that find the top selling product and its category. 
The 'Sales Trends by Branch' dashboard is designed to demonstrate how skincare is the growing dominant product of this fictional company, across many of its branches. The 'top selling product' calculation from earlier is filtered to the last month to give us the name of the current trendiest product.

