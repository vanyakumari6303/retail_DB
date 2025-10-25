# RetailDB

## Overview

RetailDB is a relational database designed for retail analytics. It manages customers, products, orders, payments, and monthly sales reports. The system can generate monthly reports and compare trends between months.

## Features

* Manage customers, products, orders, and payments
* Generate monthly reports with metrics like total sales, top product, top customer, and top city
* Compare month-over-month growth for sales, orders, customers, and average order value
* Ready for integration with dashboards or BI tools

## Database Schema

* Customers
* Products
* Orders
* OrderDetails
* Payments
* MonthlyReports

## Stored Procedures

* `GenerateAndSaveMonthlyReport(month, year)`: Generates monthly analytics and stores them in `MonthlyReports`.
* `CompareMonthlyReports(month1, year1, month2, year2)`: Compares metrics between two months and outputs growth percentages.

## Sample Data

* 5 customers in different cities
* 5 products across categories
* Orders and payments for August and September 2025
* MonthlyReports generated for August and September 2025

## Example Queries

```sql
-- Total sales by city
SELECT c.city, SUM(o.total_amount) AS Total_Sales
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY Total_Sales DESC;

-- Customer purchase history
SELECT c.name, o.order_id, o.order_date, p.name AS Product, od.quantity, od.unit_price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE c.customer_id = 1;
```

## Future Enhancements

* Auto-generate monthly reports via MySQL Event Scheduler
* Inventory tracking and low-stock alerts
* Loyalty points or discounts
* Connect to BI tools like Power BI, Tableau, or Python Dash
* Rolling 3-month trend analysis
* Predictive analytics for sales and demand

## Getting Started

1. Clone the repository
2. Import the SQL scripts to create the database and tables
3. Insert sample data
4. Run stored procedures for monthly reports and comparisons

