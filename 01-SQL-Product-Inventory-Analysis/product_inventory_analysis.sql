-- =========================================================
-- PROJECT: SQL Product Inventory & Sales Analysis
-- PURPOSE: Analyze product inventory, pricing, ratings,
--          discounts, and projected revenue.
-- =========================================================


-- Create the Products table
CREATE TABLE dbo.Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(6,2),
    StockQuantity INT,
    Rating DECIMAL(2,1)
);


-- Insert sample product data
INSERT INTO dbo.Products VALUES
(201, 'Wireless Mouse', 'Electronics', 29.99, 150, 4.5),
(202, 'Mechanical Keyboard', 'Electronics', 89.99, 45, 4.8),
(203, 'Desk Mat', 'Accessories', 19.99, 200, 4.2),
(204, 'Gaming Monitor', 'Electronics', 249.99, 15, 4.7),
(205, 'Ergonomic Chair', 'Furniture', 199.99, 8, 4.1),
(206, 'USB-C Cable', 'Accessories', 12.99, 300, 3.9);


-- =========================================================
-- BUSINESS QUESTION 1
-- What is the total inventory value of each product?
-- =========================================================

SELECT
    ProductName,
    Price,
    StockQuantity,
    Price * StockQuantity AS [Total Inventory Value]
FROM dbo.Products;


-- =========================================================
-- BUSINESS QUESTION 2
-- Which Electronics or Accessories products cost less
-- than $50 and have a rating of at least 4.0?
-- =========================================================

SELECT *
FROM dbo.Products
WHERE Category IN ('Electronics', 'Accessories')
  AND Price < 50.00
  AND Rating >= 4.0;


-- =========================================================
-- BUSINESS QUESTION 3
-- Which products start with "Wireless" or have stock
-- quantities between 10 and 50?
-- =========================================================

SELECT *
FROM dbo.Products
WHERE ProductName LIKE 'Wireless%'
   OR StockQuantity BETWEEN 10 AND 50;


-- =========================================================
-- BUSINESS QUESTION 4
-- Which product categories contain products priced
-- above $20?
-- =========================================================

SELECT DISTINCT Category
FROM dbo.Products
WHERE Price > 20.00;


-- =========================================================
-- BUSINESS QUESTION 5
-- Which highly rated non-furniture products have low
-- stock or are priced at $100 or more?
-- =========================================================

SELECT
    ProductName,
    Category,
    Price,
    StockQuantity,
    Rating
FROM dbo.Products
WHERE Category <> 'Furniture'
  AND Rating >= 4.5
  AND (StockQuantity < 50 OR Price >= 100.00);


-- =========================================================
-- BUSINESS QUESTION 6
-- Which high-stock products could generate more than
-- $3,000 in projected revenue after a 15% discount?
-- =========================================================

SELECT
    ProductName,
    Category,
    Price AS [Original Price],
    Price * 0.85 AS [Discounted Price],
    Price * 0.85 * StockQuantity AS [Projected Revenue],
    Price * 0.15 * StockQuantity AS [Customer Savings]
FROM dbo.Products
WHERE StockQuantity > 100
  AND ProductName LIKE '% %'
  AND Price * 0.85 * StockQuantity > 3000.00;
