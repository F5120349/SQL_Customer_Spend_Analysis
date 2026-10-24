-- SQL Customer Spend Analysis


-- Selecting the database to use
USE AdventureWorksLT2025;

-- Query to analyse customer spending and order history
SELECT 
	c.CustomerID,
	CONCAT(c.CompanyName, ' (', c.FirstName, ' ', c.LastName, ')') AS CustomerAndContact,
	ROUND(SUM(soh.TotalDue), 2) AS TotalLifetimeSpend,
	COUNT(DISTINCT(soh.SalesOrderID)) AS TotalOrders,
	SUM(soh.TotalDue) - (SELECT AVG(TotalDue) FROM SalesLT.SalesOrderHeader) AS SpendvsAverageOrder


-- Selecting the SalesOrderHeader table to get order details
FROM SalesLT.SalesOrderHeader AS soh


-- Joining the SalesOrderHeader table with the Customer table to get customer details
INNER JOIN SalesLT.Customer AS c 
	ON c.CustomerID = soh.CustomerID

-- Grouping the results by customer details to get aggregated spend and order counts
GROUP BY 
	c.CustomerID, 
	c.CompanyName, 
	c.FirstName, 
	c.LastName

/* Filtering the results to only include customers with more than one order
and nothing should return since in this database they all have 1 order each */
HAVING COUNT(DISTINCT(soh.SalesOrderID)) > 0


-- Ordering the results by total lifetime spend in descending order to see the highest spenders first
ORDER BY TotalLifetimeSpend DESC;