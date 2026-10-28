# SQL Customer Spend Analysis

A SQL Server analysis project that explores customer spending and order history using the **AdventureWorksLT2025** sample database.

The project uses SQL queries to combine customer and sales order data, calculate customer-level spending metrics, and identify customers with the highest lifetime spend.

## Overview

This project demonstrates the use of SQL Server to analyse customer and sales data.

The main query:

- Joins customer information with sales order data
- Calculates each customer's total lifetime spend
- Counts the number of orders placed by each customer
- Compares customer lifetime spend against the average order value
- Groups results by customer
- Sorts customers by total lifetime spend

## Technologies Used

- **Microsoft SQL Server**
- **T-SQL**
- **AdventureWorksLT2025**
- SQL aggregation and grouping
- Table joins
- Subqueries
- Filtering with `HAVING`
- Data type conversion and rounding

## Key SQL Concepts Demonstrated

### INNER JOIN

Customer and sales order information are combined using an `INNER JOIN` between the `SalesLT.Customer` and `SalesLT.SalesOrderHeader` tables.

### Aggregate Functions

The query uses aggregate functions to calculate customer-level metrics:

- `SUM()` – total customer spending
- `COUNT(DISTINCT ...)` – number of orders
- `AVG()` – average order value

### GROUP BY

Customer information is grouped to produce one aggregated result for each customer.

### HAVING

A `HAVING` clause is used to filter the grouped results based on the number of orders.

### Subquery

A subquery calculates the average `TotalDue` across sales orders, which is then used when calculating the `SpendvsAverageOrder` value.

### Data Formatting

The query also demonstrates:

- `CONCAT()` for combining customer details
- `ROUND()` for rounding monetary values
- `CAST()` for controlling the numeric data type and precision

## Example Analysis

The resulting dataset provides information such as:

| Column | Description |
| --- | --- |
| `CustomerID` | Unique customer identifier |
| `CustomerAndContact` | Customer company and contact name |
| `TotalLifetimeSpend` | Total value of the customer's orders |
| `TotalOrders` | Number of distinct orders |
| `SpendvsAverageOrder` | Customer spend compared with the average order value |

The results are ordered by `TotalLifetimeSpend` in descending order, allowing the highest-spending customers to be identified first.

## Database

This project uses the **AdventureWorksLT2025** sample database.

The SQL script begins by selecting the database:

```sql
USE AdventureWorksLT2025;
```

The project expects the relevant `SalesLT.Customer` and `SalesLT.SalesOrderHeader` tables to be available.

## How to Run

1. Install or open **Microsoft SQL Server** with a SQL Server-compatible query environment.
2. Ensure the `AdventureWorksLT2025` database is installed.
3. Open `SQL_Customer_Spend_Analysis.sql`.
4. Execute the script against the `AdventureWorksLT2025` database.
5. Review the returned customer spending analysis.

## Project Structure

```text
SQL_Customer_Spend_Analysis/
│
├── SQL_Customer_Spend_Analysis.sql
├── README.md
├── .gitignore
└── .gitattributes
```

## Purpose

This project was created to practise SQL querying and data analysis using a relational database. It demonstrates the ability to retrieve, join, aggregate and analyse data to produce useful customer spending information.
