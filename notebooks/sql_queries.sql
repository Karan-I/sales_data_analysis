-- 1. Total Orders Per Month
SELECT strftime('%Y-%m', "Order Date") AS month_year, COUNT(*) AS total_orders
FROM sales
GROUP BY month_year
ORDER BY month_year;

-- 2. Total Orders Per Year
SELECT strftime('%Y', "Order Date") AS year, COUNT(*) AS total_orders
FROM sales
GROUP BY year
ORDER BY year;

-- 3. Top 5 Customers by Number of Orders
SELECT "Customer ID", COUNT(*) AS total_orders
FROM sales
GROUP BY "Customer ID"
ORDER BY total_orders DESC
LIMIT 5;

-- 4. Orders by Ship Mode
SELECT "Ship Mode", COUNT(*) AS total_orders
FROM sales
GROUP BY "Ship Mode"
ORDER BY total_orders DESC;

-- 5. Average Shipping Time (in days)
SELECT 
    AVG(julianday("Ship Date") - julianday("Order Date")) AS avg_shipping_days
FROM sales
WHERE "Ship Date" IS NOT NULL;

-- 6. Monthly Average Shipping Time
SELECT 
    strftime('%Y-%m', "Order Date") AS month_year,
    AVG(julianday("Ship Date") - julianday("Order Date")) AS avg_shipping_days
FROM sales
WHERE "Ship Date" IS NOT NULL
GROUP BY month_year
ORDER BY month_year;
