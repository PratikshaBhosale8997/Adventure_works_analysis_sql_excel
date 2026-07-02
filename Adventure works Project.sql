                                            -- ============================================================
                                                          -- PROJECT: ADVENTURE WORKS Analysis --
											-- ============================================================
                                            


-- Switch to use this database for all operation
USE AdventureWorks;

-- ============================================================
-- QUESTION 0 - UNION OF BOTH SALES TABLES
-- Explanation: Combining two separate sales files into one complete view
-- This is like "Append" in Power Query or "Union" in Excel
-- ============================================================

CREATE OR REPLACE VIEW sales_combined AS
SELECT * FROM factinternetsales
UNION ALL                                          -- UNION ALL keeps all rows (including duplicates)
SELECT * FROM factinternetsalesnew;                

-- Verify the union worked correctly
SELECT 'Original Sales' AS TableName, COUNT(*) AS RowCount FROM factinternetsales
UNION ALL
SELECT 'New Sales', COUNT(*) FROM factinternetsalesnew
UNION ALL
SELECT 'Combined Sales', COUNT(*) FROM sales_combined;


-- ============================================================
-- QUESTION 1: Lookup the productname from the Product table to  
-- Sales table
-- ============================================================

-- Solution: Join sales table with product table using ProductKey
SELECT 
    s.*,
    p.EnglishProductName
FROM sales_combined s
LEFT JOIN dimproduct p ON s.ProductKey = p.ProductKey;


-- ============================================================
-- QUESTION 2: Lookup the Customerfullname from the Customer and Unit 
-- Price from Product table to Sales table
-- ============================================================

-- Solution: Join with customer table for name, join with product table 
-- for unit price
SELECT 
    s.*,
    CONCAT(c.FirstName, ' ', COALESCE(c.MiddleName, ''), ' ', c.LastName) 
    AS CustomerFullName,
    p.UnitPrice AS ProductUnitPrice
FROM sales_combined s
LEFT JOIN dimcustomer c ON s.CustomerKey = c.CustomerKey
LEFT JOIN dimproduct p ON s.ProductKey = p.ProductKey;


-- ============================================================
-- QUESTION 3: Calculate fields from OrderDateKey (First Create a Date 
-- Field from OrderDateKey)
-- ============================================================

--  Create a view with the Date column first
CREATE OR REPLACE VIEW sales_with_date AS
SELECT 
    *,
    STR_TO_DATE(OrderDateKey, '%Y%m%d') AS Date
FROM sales_combined;

-- extract all date fields from the OrderDate column
SELECT 
    date,
    YEAR(Date) AS Year,
    MONTH(Date) AS MonthNo,
    MONTHNAME(Date) AS MonthFullName,
    CONCAT('Q', QUARTER(Date)) AS Quarter,
    DATE_FORMAT(Date, '%Y-%b') AS YearMonth,
    WEEKDAY(Date) + 1 AS WeekdayNo,
    DAYNAME(Date) AS WeekdayName,
    CASE 
        WHEN MONTH(Date) >= 7 THEN MONTH(Date) - 6
        ELSE MONTH(Date) + 6
    END AS FinancialMonth,
    CASE 
        WHEN MONTH(Date) >= 7 AND MONTH(Date) <= 9 THEN 'FQ1'
        WHEN MONTH(Date) >= 10 AND MONTH(Date) <= 12 THEN 'FQ2'
        WHEN MONTH(Date) >= 1 AND MONTH(Date) <= 3 THEN 'FQ3'
        ELSE 'FQ4'
    END AS FinancialQuarter
FROM sales_with_date;
    

   -- ============================================================
-- QUESTION 4: Calculate the Sales amount 
-- ============================================================

select 
UnitPrice * OrderQuantity AS SalesAmount
from sales_combined;

-- ============================================================
-- QUESTION 5: Calculate the Production cost 
-- ============================================================
SELECT *,
       ProductionStandardcost * OrderQuantity AS ProductionCost
FROM sales_combined ;


-- ============================================================
-- QUESTION 6: Calculate the profit
-- Formula: Profit = SalesAmount - ProductionCost
-- ============================================================

SELECT *,salesAmount - ProductionStandardcost AS Profit
FROM sales_combined ;


-- 1. Overall KPIs
select 
		round(sum(UnitPrice * OrderQuantity),2) AS Total_Sales,
        round(sum(ProductionStandardcost * OrderQuantity),2) As Total_Cost,
        round(sum(salesAmount - ProductionStandardcost),2) As Total_Profit,
        round(count(ProductKey),2) As Total_orders,
        concat(round((sum(salesAmount - ProductionStandardcost)/sum(UnitPrice *
        OrderQuantity)*100),2),"%") as Profit_Margin
FROM sales_combined ;


-- 2. Sales by Year 
SELECT 
    YEAR(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS Year,
    ROUND(SUM(UnitPrice * OrderQuantity * (1 - UnitPriceDiscountPct)), 2) 
    AS TotalSales
FROM sales_combined
GROUP BY YEAR(STR_TO_DATE(OrderDateKey, '%Y%m%d'))
ORDER BY Year;


-- 3. Sales by Month 

SELECT 
    MONTHNAME(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS Month,
    ROUND(SUM(UnitPrice * OrderQuantity * (1 - UnitPriceDiscountPct)), 2) AS TotalSales
FROM sales_combined
WHERE YEAR(STR_TO_DATE(OrderDateKey, '%Y%m%d')) = 2013
GROUP BY MONTH(STR_TO_DATE(OrderDateKey, '%Y%m%d')), MONTHNAME(STR_TO_DATE(OrderDateKey, '%Y%m%d'))
ORDER BY MONTH(STR_TO_DATE(OrderDateKey, '%Y%m%d'));


-- 4. Top 10 Products

SELECT 
    p.EnglishProductName,
    ROUND(SUM(s.UnitPrice * s.OrderQuantity * (1 - s.UnitPriceDiscountPct)), 2) 
    AS TotalSales
FROM sales_combined s
LEFT JOIN dimproduct p ON s.ProductKey = p.ProductKey
GROUP BY p.EnglishProductName
ORDER BY TotalSales DESC
LIMIT 10;

-- 5. Top 10 Customers

SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    ROUND(SUM(s.UnitPrice * s.OrderQuantity * (1 - s.UnitPriceDiscountPct)), 2) AS TotalSales
FROM sales_combined s
LEFT JOIN dimcustomer c ON s.CustomerKey = c.CustomerKey
GROUP BY c.CustomerKey, c.FirstName, c.LastName
ORDER BY TotalSales DESC
LIMIT 10;