CREATE DATABASE RetailDB;
USE RetailDB;

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50)
);

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    orderdetail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    amount DECIMAL(10,2),
    method VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Customers (10 sample customers)
INSERT INTO Customers (name, email, phone, city) VALUES
('Riya Sharma', 'riya.sharma@example.com', '9876543210', 'Delhi'),
('Arjun Mehta', 'arjun.mehta@example.com', '9898989898', 'Mumbai'),
('Sneha Patel', 'sneha.patel@example.com', '9789012345', 'Ahmedabad'),
('Karan Singh', 'karan.singh@example.com', '9811122233', 'Bangalore'),
('Priya Nair', 'priya.nair@example.com', '9797979797', 'Kochi'),
('Rahul Verma', 'rahul.verma@example.com', '9900112233', 'Pune'),
('Neha Gupta', 'neha.gupta@example.com', '9822223344', 'Jaipur'),
('Vikram Rao', 'vikram.rao@example.com', '9833334455', 'Hyderabad'),
('Aditi Desai', 'aditi.desai@example.com', '9844445566', 'Chennai'),
('Suresh Iyer', 'suresh.iyer@example.com', '9855556677', 'Kolkata'),
('Aarav Sharma', 'aarav.sharma@email.com', '9876543210', 'Delhi'),
('Priya Verma', 'priya.verma@email.com', '9876543211', 'Mumbai'),
('Rohan Mehta', 'rohan.mehta@email.com', '9876543212', 'Bangalore'),
('Neha Gupta', 'neha.gupta@email.com', '9876543213', 'Chennai'),
('Karan Patel', 'karan.patel@email.com', '9876543214', 'Kolkata');

select * from customers;

-- Products (15 sample products)
INSERT INTO Products (name, category, price) VALUES
('Laptop HP Pavilion', 'Electronics', 65000.00),
('iPhone 14', 'Electronics', 79999.00),
('Samsung Galaxy S23', 'Electronics', 74999.00),
('Bluetooth Headphones', 'Accessories', 2999.00),
('Smartwatch Fitbit', 'Accessories', 10999.00),
('Office Chair', 'Furniture', 5999.00),
('Study Table', 'Furniture', 4999.00),
('LED TV 43-inch', 'Electronics', 38999.00),
('Washing Machine LG', 'Appliances', 25999.00),
('Refrigerator Samsung', 'Appliances', 31999.00),
('Microwave Oven', 'Appliances', 8999.00),
('Shoes Nike Air', 'Fashion', 4999.00),
('T-Shirt Adidas', 'Fashion', 1999.00),
('Jeans Levi’s', 'Fashion', 2999.00),
('Backpack Wildcraft', 'Accessories', 2499.00),
('Laptop', 'Electronics', 60000.00),
('Smartphone', 'Electronics', 25000.00),
('Headphones', 'Accessories', 3000.00),
('Shoes', 'Footwear', 4000.00),
('Watch', 'Accessories', 8000.00);


select * from products;

-- Orders (15 sample orders)
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2025-09-10', 4999.00),
(2, '2025-09-11', 25999.00),
(3, '2025-09-12', 84998.00),
(4, '2025-09-13', 10999.00),
(5, '2025-09-14', 31999.00),
(6, '2025-09-15', 38999.00),
(7, '2025-09-16', 65000.00),
(8, '2025-09-17', 2999.00),
(9, '2025-09-18', 5999.00),
(10, '2025-09-19', 79999.00),
(3, '2025-09-20', 74999.00),
(4, '2025-09-21', 1999.00),
(1, '2025-09-22', 31999.00),
(2, '2025-09-23', 4999.00),
(5, '2025-09-24', 8999.00);
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
(1, '2025-08-05', 65000.00),
(2, '2025-08-10', 28000.00),
(3, '2025-08-15', 9000.00),
(4, '2025-09-03', 4300.00),
(5, '2025-09-10', 83000.00),
(1, '2025-09-15', 3500.00 );


select * from orders;

-- OrderDetails (20 rows)
INSERT INTO OrderDetails (order_id, product_id, quantity, unit_price) VALUES
(1, 12, 1, 4999.00),
(2, 9, 1, 25999.00),
(3, 2, 1, 79999.00),
(3, 4, 1, 2999.00),
(4, 5, 1, 10999.00),
(5, 10, 1, 31999.00),
(6, 8, 1, 38999.00),
(7, 1, 1, 65000.00),
(8, 4, 1, 2999.00),
(9, 6, 1, 5999.00),
(10, 2, 1, 79999.00),
(11, 3, 1, 74999.00),
(12, 13, 1, 1999.00),
(13, 10, 1, 31999.00),
(14, 15, 2, 2499.00),
(15, 11, 1, 8999.00),
(6, 14, 1, 2999.00),
(9, 7, 1, 4999.00),
(1, 13, 2, 1999.00),
(5, 4, 1, 2999.00),
-- August orders
(1, 1, 1, 60000.00),
(1, 3, 2, 2500.00),
(2, 2, 1, 25000.00),
(2, 3, 1, 3000.00),
(3, 4, 2, 4500.00),
-- September orders
(4, 4, 1, 4300.00),
(5, 1, 1, 60000.00),
(5, 5, 1, 8000.00),
(5, 2, 1, 15000.00),
(6, 3, 1, 3500.00);


select * from orderDetails;

-- Payments (15 rows)
INSERT INTO Payments (order_id, amount, method, status) VALUES
(1, 4999.00, 'UPI', 'Success'),
(2, 25999.00, 'Credit Card', 'Success'),
(3, 82998.00, 'NetBanking', 'Success'),
(4, 10999.00, 'UPI', 'Success'),
(5, 31999.00, 'Debit Card', 'Success'),
(6, 41998.00, 'UPI', 'Success'),
(7, 65000.00, 'Credit Card', 'Pending'),
(8, 2999.00, 'UPI', 'Success'),
(9, 10998.00, 'NetBanking', 'Success'),
(10, 79999.00, 'Credit Card', 'Success'),
(11, 74999.00, 'UPI', 'Success'),
(12, 1999.00, 'UPI', 'Success'),
(13, 31999.00, 'Credit Card', 'Success'),
(14, 4999.00, 'UPI', 'Pending'),
(15, 8999.00, 'NetBanking', 'Success'),
(1, 65000.00, 'Credit Card', 'Completed'),
(2, 28000.00, 'UPI', 'Completed'),
(3, 9000.00, 'Debit Card', 'Completed'),
(4, 4300.00, 'Cash', 'Completed'),
(5, 83000.00, 'Credit Card', 'Completed'),
(6, 3500.00, 'UPI', 'Completed');


select * from payments;

-- total sales by city
SELECT 
    c.city AS City,
    SUM(o.total_amount) AS Total_Sales
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.city
ORDER BY 
    Total_Sales DESC;
    
-- total completed sales by city(sucessfull payments)
SELECT 
    c.city AS City,
    SUM(p.amount) AS Total_Sales
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
JOIN 
    Payments p ON o.order_id = p.order_id
WHERE 
    p.status = 'Success'
GROUP BY 
    c.city
ORDER BY 
    Total_Sales DESC;

-- top seeling product by quantity 
SELECT 
    p.name AS Product_Name,
    SUM(od.quantity) AS Total_Quantity_Sold
FROM 
    OrderDetails od
JOIN 
    Products p ON od.product_id = p.product_id
GROUP BY 
    p.product_id, p.name
ORDER BY 
    Total_Quantity_Sold DESC
LIMIT 1;

-- top selling product by revenue 
SELECT 
    p.name AS Product_Name,
    SUM(od.quantity * od.unit_price) AS Total_Revenue
FROM 
    OrderDetails od
JOIN 
    Products p ON od.product_id = p.product_id
GROUP BY 
    p.product_id, p.name
ORDER BY 
    Total_Revenue DESC
LIMIT 1;

-- top five product 
SELECT 
    p.name AS Product_Name,
    SUM(od.quantity) AS Total_Quantity_Sold,
    SUM(od.quantity * od.unit_price) AS Total_Revenue
FROM 
    OrderDetails od
JOIN 
    Products p ON od.product_id = p.product_id
GROUP BY 
    p.product_id, p.name
ORDER BY 
    Total_Quantity_Sold DESC
LIMIT 5;

-- complete customer purchase history 
SELECT 
    c.name AS Customer_Name,
    c.city AS City,
    o.order_id AS Order_ID,
    o.order_date AS Order_Date,
    p.name AS Product_Name,
    od.quantity AS Quantity,
    od.unit_price AS Unit_Price,
    (od.quantity * od.unit_price) AS Total_Item_Amount,
    pay.method AS Payment_Method,
    pay.status AS Payment_Status
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
JOIN 
    OrderDetails od ON o.order_id = od.order_id
JOIN 
    Products p ON od.product_id = p.product_id
LEFT JOIN 
    Payments pay ON o.order_id = pay.order_id
ORDER BY 
    c.name, o.order_date;

-- purcahes hostory for a particular customer 
SELECT 
    o.order_id,
    o.order_date,
    p.name AS Product_Name,
    od.quantity,
    od.unit_price,
    (od.quantity * od.unit_price) AS Total_Item_Amount,
    pay.method AS Payment_Method,
    pay.status AS Payment_Status
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
JOIN 
    OrderDetails od ON o.order_id = od.order_id
JOIN 
    Products p ON od.product_id = p.product_id
LEFT JOIN 
    Payments pay ON o.order_id = pay.order_id
WHERE 
    c.name = 'Riya Sharma'
ORDER BY 
    o.order_date;
-- total spent per customer 
SELECT 
    c.name AS Customer_Name,
    SUM(o.total_amount) AS Total_Spent
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name
ORDER BY 
    Total_Spent DESC;

-- Create View: CustomerPurchaseHistoryView
CREATE VIEW CustomerPurchaseHistoryView AS
SELECT 
    c.customer_id,
    c.name AS Customer_Name,
    c.city AS City,
    o.order_id AS Order_ID,
    o.order_date AS Order_Date,
    p.name AS Product_Name,
    od.quantity AS Quantity,
    od.unit_price AS Unit_Price,
    (od.quantity * od.unit_price) AS Total_Item_Amount,
    pay.method AS Payment_Method,
    pay.status AS Payment_Status
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
JOIN 
    OrderDetails od ON o.order_id = od.order_id
JOIN 
    Products p ON od.product_id = p.product_id
LEFT JOIN 
    Payments pay ON o.order_id = pay.order_id;

-- Show entire purchase history
SELECT * FROM CustomerPurchaseHistoryView;

-- Show a specific customer’s history
SELECT * 
FROM CustomerPurchaseHistoryView
WHERE Customer_Name = 'Aditi Desai'
ORDER BY Order_Date;

-- shoe top spenders
SELECT 
    Customer_Name, 
    SUM(Total_Item_Amount) AS Total_Spent
FROM 
    CustomerPurchaseHistoryView
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Spent DESC;

-- Create View: CitySalesSummaryView
CREATE VIEW CitySalesSummaryView AS
SELECT 
    c.city AS City,
    SUM(o.total_amount) AS Total_Sales,
    COUNT(o.order_id) AS Total_Orders,
    COUNT(DISTINCT c.customer_id) AS Total_Customers
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.city;

-- Show all city sales summaries
select * from citySalesSummaryView;

-- top 3 cities by sales 
SELECT * 
FROM CitySalesSummaryView
ORDER BY Total_Sales DESC
LIMIT 3;

-- cities with more than rupees 50000 sales 
SELECT *
FROM CitySalesSummaryView
WHERE Total_Sales > 50000;

-- stored procedure queries 
-- 1. Procedure to get total sales by a specific city
DELIMITER $$
CREATE PROCEDURE GetSalesByCity(IN city_name VARCHAR(50))
BEGIN
    SELECT 
        c.city,
        SUM(o.total_amount) AS Total_Sales
    FROM 
        Customers c
    JOIN 
        Orders o ON c.customer_id = o.customer_id
    WHERE 
        c.city = city_name
    GROUP BY 
        c.city;
END $$
DELIMITER ;


-- Run it:
CALL GetSalesByCity('Delhi');

-- 2. Procedure to list all orders for a specific customer
DELIMITER $$
CREATE PROCEDURE GetCustomerOrders(IN cust_name VARCHAR(100))
BEGIN
    SELECT 
        o.order_id,
        o.order_date,
        o.total_amount,
        p.status AS Payment_Status
    FROM 
        Customers c
    JOIN 
        Orders o ON c.customer_id = o.customer_id
    LEFT JOIN 
        Payments p ON o.order_id = p.order_id
    WHERE 
        c.name = cust_name
    ORDER BY 
        o.order_date;
END $$
DELIMITER ;

-- Run it:
CALL GetCustomerOrders('Riya Sharma');

-- 3. Procedure to insert a new product
DELIMITER $$
CREATE PROCEDURE AddNewProduct(
    IN pname VARCHAR(100),
    IN pcategory VARCHAR(50),
    IN pprice DECIMAL(10,2)
)
BEGIN
    INSERT INTO Products (name, category, price)
    VALUES (pname, pcategory, pprice);
END $$
DELIMITER ;

-- Run it:
CALL AddNewProduct('Smart Speaker', 'Electronics', 4999.00);

-- 4.Procedure to calculate total sales for a given date range
DELIMITER $$
CREATE PROCEDURE GetSalesBetweenDates(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT 
        SUM(total_amount) AS Total_Sales
    FROM 
        Orders
    WHERE 
        order_date BETWEEN start_date AND end_date;
END $$
DELIMITER ;

-- Run it:
CALL GetSalesBetweenDates('2025-09-10', '2025-09-20');

-- function queries
-- 1.Function to calculate total spent by a specific customer
DELIMITER $$
CREATE FUNCTION GetTotalSpent(cust_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_spent DECIMAL(10,2);
    SELECT SUM(total_amount)
    INTO total_spent
    FROM Orders
    WHERE customer_id = cust_id;
    RETURN IFNULL(total_spent, 0);
END $$
DELIMITER ;

-- Run it:
SELECT GetTotalSpent(1) AS Total_Spent_By_Customer1;

-- 2. Function to calculate discount based on order amount
DELIMITER $$
CREATE FUNCTION CalculateDiscount(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE discount DECIMAL(10,2);
    IF amount >= 50000 THEN
        SET discount = amount * 0.10;  -- 10% discount
    ELSEIF amount >= 20000 THEN
        SET discount = amount * 0.05;  -- 5% discount
    ELSE
        SET discount = 0;
    END IF;
    RETURN discount;
END $$
DELIMITER ;

-- Run it:
SELECT order_id, total_amount, CalculateDiscount(total_amount) AS Discount
FROM Orders;

-- 3. Function to return order status (based on Payments table)
DELIMITER $$
CREATE FUNCTION GetOrderStatus(ord_id INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(50);
    SELECT status INTO status_val
    FROM Payments
    WHERE order_id = ord_id
    LIMIT 1;
    RETURN IFNULL(status_val, 'Pending');
END $$
DELIMITER ;

-- Run it:
SELECT order_id, GetOrderStatus(order_id) AS Order_Status FROM Orders;

-- GenerateMonthlyDashboard
DELIMITER $$
CREATE PROCEDURE GenerateMonthlyDashboard(IN report_month INT, IN report_year INT)
BEGIN
    DECLARE total_sales DECIMAL(15,2);
    DECLARE avg_order_value DECIMAL(15,2);
    DECLARE total_orders INT;
    DECLARE total_customers INT;
    DECLARE top_city VARCHAR(100);
    DECLARE top_city_sales DECIMAL(15,2);
    DECLARE top_product VARCHAR(100);
    DECLARE top_product_sales DECIMAL(15,2);
    DECLARE top_customer VARCHAR(100);
    DECLARE top_customer_spent DECIMAL(15,2);

    -- 1️)Total sales, total orders, avg order value
    SELECT 
        SUM(o.total_amount), 
        COUNT(o.order_id), 
        AVG(o.total_amount)
    INTO 
        total_sales, total_orders, avg_order_value
    FROM Orders o
    WHERE MONTH(o.order_date) = report_month AND YEAR(o.order_date) = report_year;

    -- 2️)Total unique customers
    SELECT COUNT(DISTINCT customer_id)
    INTO total_customers
    FROM Orders
    WHERE MONTH(order_date) = report_month AND YEAR(order_date) = report_year;

    -- 3️)Top city by sales
    SELECT 
        c.city, 
        SUM(o.total_amount) AS city_sales
    INTO 
        top_city, top_city_sales
    FROM Orders o
    JOIN Customers c ON o.customer_id = c.customer_id
    WHERE MONTH(o.order_date) = report_month AND YEAR(o.order_date) = report_year
    GROUP BY c.city
    ORDER BY city_sales DESC
    LIMIT 1;

    -- 4️)Top product by revenue
    SELECT 
        p.name, 
        SUM(od.quantity * od.unit_price) AS product_sales
    INTO 
        top_product, top_product_sales
    FROM OrderDetails od
    JOIN Products p ON od.product_id = p.product_id
    JOIN Orders o ON od.order_id = o.order_id
    WHERE MONTH(o.order_date) = report_month AND YEAR(o.order_date) = report_year
    GROUP BY p.product_id, p.name
    ORDER BY product_sales DESC
    LIMIT 1;

    -- 5️)Top customer by spending
    SELECT 
        c.name, 
        SUM(o.total_amount) AS spent
    INTO 
        top_customer, top_customer_spent
    FROM Orders o
    JOIN Customers c ON o.customer_id = c.customer_id
    WHERE MONTH(o.order_date) = report_month AND YEAR(o.order_date) = report_year
    GROUP BY c.customer_id, c.name
    ORDER BY spent DESC
    LIMIT 1;

    -- 6️)Display unified summary dashboard
    SELECT 
        CONCAT(MONTHNAME(STR_TO_DATE(report_month, '%m')), ' ', report_year) AS Report_Period,
        total_sales AS Total_Sales,
        total_orders AS Total_Orders,
        total_customers AS Total_Customers,
        ROUND(avg_order_value, 2) AS Average_Order_Value,
        top_city AS Top_City,
        top_city_sales AS Top_City_Sales,
        top_product AS Top_Product,
        top_product_sales AS Top_Product_Sales,
        top_customer AS Top_Customer,
        top_customer_spent AS Top_Customer_Spent;
END $$
DELIMITER ;

-- to run
CALL GenerateMonthlyDashboard(9, 2025);

-- MonthlyReports
-- Step 1: Create the MonthlyReports Table
CREATE TABLE MonthlyReports (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    report_month INT,
    report_year INT,
    total_sales DECIMAL(15,2),
    total_orders INT,
    total_customers INT,
    avg_order_value DECIMAL(15,2),
    top_city VARCHAR(100),
    top_city_sales DECIMAL(15,2),
    top_product VARCHAR(100),
    top_product_sales DECIMAL(15,2),
    top_customer VARCHAR(100),
    top_customer_spent DECIMAL(15,2),
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Create Enhanced Procedure (This will insert the monthly summary into the table and also show the report output live when you call it.)
DELIMITER $$
CREATE PROCEDURE GenerateAndSaveMonthlyReport(IN report_month INT, IN report_year INT)
BEGIN
    DECLARE total_sales DECIMAL(15,2);
    DECLARE avg_order_value DECIMAL(15,2);
    DECLARE total_orders INT;
    DECLARE total_customers INT;
    DECLARE top_city VARCHAR(100);
    DECLARE top_city_sales DECIMAL(15,2);
    DECLARE top_product VARCHAR(100);
    DECLARE top_product_sales DECIMAL(15,2);
    DECLARE top_customer VARCHAR(100);
    DECLARE top_customer_spent DECIMAL(15,2);

    -- 1️)Compute totals
    SELECT 
        SUM(o.total_amount), 
        COUNT(o.order_id), 
        AVG(o.total_amount)
    INTO 
        total_sales, total_orders, avg_order_value
    FROM Orders o
    WHERE MONTH(o.order_date) = report_month AND YEAR(o.order_date) = report_year;

    -- 2️)Total unique customers
    SELECT COUNT(DISTINCT customer_id)
    INTO total_customers
    FROM Orders
    WHERE MONTH(order_date) = report_month AND YEAR(order_date) = report_year;

    -- 3️)Top city
    SELECT c.city, SUM(o.total_amount)
    INTO top_city, top_city_sales
    FROM Orders o
    JOIN Customers c ON o.customer_id = c.customer_id
    WHERE MONTH(o.order_date) = report_month AND YEAR(o.order_date) = report_year
    GROUP BY c.city
    ORDER BY SUM(o.total_amount) DESC
    LIMIT 1;

    -- 4️)Top product
    SELECT p.name, SUM(od.quantity * od.unit_price)
    INTO top_product, top_product_sales
    FROM OrderDetails od
    JOIN Products p ON od.product_id = p.product_id
    JOIN Orders o ON od.order_id = o.order_id
    WHERE MONTH(o.order_date) = report_month AND YEAR(o.order_date) = report_year
    GROUP BY p.product_id
    ORDER BY SUM(od.quantity * od.unit_price) DESC
    LIMIT 1;

    -- 5️)Top customer
    SELECT c.name, SUM(o.total_amount)
    INTO top_customer, top_customer_spent
    FROM Orders o
    JOIN Customers c ON o.customer_id = c.customer_id
    WHERE MONTH(o.order_date) = report_month AND YEAR(o.order_date) = report_year
    GROUP BY c.customer_id
    ORDER BY SUM(o.total_amount) DESC
    LIMIT 1;

    -- 6️)Insert into MonthlyReports table
    INSERT INTO MonthlyReports (
        report_month, report_year, total_sales, total_orders, total_customers, 
        avg_order_value, top_city, top_city_sales, 
        top_product, top_product_sales, top_customer, top_customer_spent
    )
    VALUES (
        report_month, report_year, total_sales, total_orders, total_customers,
        avg_order_value, top_city, top_city_sales,
        top_product, top_product_sales, top_customer, top_customer_spent
    );

    -- 7️)Display the dashboard live
    SELECT 
        CONCAT(MONTHNAME(STR_TO_DATE(report_month, '%m')), ' ', report_year) AS Report_Period,
        total_sales AS Total_Sales,
        total_orders AS Total_Orders,
        total_customers AS Total_Customers,
        ROUND(avg_order_value, 2) AS Average_Order_Value,
        top_city AS Top_City,
        top_city_sales AS Top_City_Sales,
        top_product AS Top_Product,
        top_product_sales AS Top_Product_Sales,
        top_customer AS Top_Customer,
        top_customer_spent AS Top_Customer_Spent;
END $$
DELIMITER ;

-- to run
CALL GenerateAndSaveMonthlyReport(9, 2025);

-- Step 4: View Historical Reports,(You can check all saved reports with:)
SELECT 
    CONCAT(MONTHNAME(STR_TO_DATE(report_month, '%m')), ' ', report_year) AS Report_Period,
    total_sales, total_orders, total_customers, avg_order_value,
    top_city, top_product, top_customer, generated_at
FROM MonthlyReports
ORDER BY generated_at DESC;

-- Schedule automatic monthly generation via MySQL Event Scheduler:
CREATE EVENT AutoMonthlyReport
ON SCHEDULE EVERY 1 MONTH
STARTS '2025-11-01 00:00:00'
DO
    CALL GenerateAndSaveMonthlyReport(MONTH(CURDATE() - INTERVAL 1 MONTH), YEAR(CURDATE() - INTERVAL 1 MONTH));

-- CompareMonthlyReports
DROP PROCEDURE IF EXISTS CompareMonthlyReports;

DELIMITER $$
CREATE PROCEDURE CompareMonthlyReports(
    IN month1 INT, IN year1 INT,
    IN month2 INT, IN year2 INT
)
BEGIN
    DECLARE s1 DECIMAL(15,2); DECLARE s2 DECIMAL(15,2);
    DECLARE o1 INT; DECLARE o2 INT;
    DECLARE c1 INT; DECLARE c2 INT;
    DECLARE a1 DECIMAL(15,2); DECLARE a2 DECIMAL(15,2);

    -- 1️)Get first month stats
    SELECT total_sales, total_orders, total_customers, avg_order_value
    INTO s1, o1, c1, a1
    FROM MonthlyReports
    WHERE report_month = month1 AND report_year = year1
    LIMIT 1;

    -- 2️)Get second month stats
    SELECT total_sales, total_orders, total_customers, avg_order_value
    INTO s2, o2, c2, a2
    FROM MonthlyReports
    WHERE report_month = month2 AND report_year = year2
    LIMIT 1;

    -- 3️)Display comparison
    SELECT 
        CONCAT(MONTHNAME(STR_TO_DATE(month1, '%m')), ' ', year1) AS Period_1,
        CONCAT(MONTHNAME(STR_TO_DATE(month2, '%m')), ' ', year2) AS Period_2,
        s1 AS Sales_M1,
        s2 AS Sales_M2,
        ROUND(((s2 - s1) / s1) * 100, 2) AS Sales_Growth_Percent,
        o1 AS Orders_M1,
        o2 AS Orders_M2,
        ROUND(((o2 - o1) / o1) * 100, 2) AS Orders_Growth_Percent,
        c1 AS Customers_M1,
        c2 AS Customers_M2,
        ROUND(((c2 - c1) / c1) * 100, 2) AS Customers_Growth_Percent,
        a1 AS Avg_Order_Value_M1,
        a2 AS Avg_Order_Value_M2,
        ROUND(((a2 - a1) / a1) * 100, 2) AS AOV_Growth_Percent;
END $$
DELIMITER ;

-- to run (Compare August 2025 vs September 2025)
CALL CompareMonthlyReports(8, 2025, 9, 2025);

SELECT * FROM MonthlyReports;

CALL GenerateAndSaveMonthlyReport(8, 2025);

CALL GenerateAndSaveMonthlyReport(9, 2025);




