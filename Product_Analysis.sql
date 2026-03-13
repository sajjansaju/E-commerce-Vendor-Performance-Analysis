-- 2. Product Performance Analysis
-- 6) Top 10 best-selling products by revenue
SELECT
    p.product_id,
    p.product_name,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- 7) Rank products within each category based on total revenue
WITH product_revenue AS (
    SELECT
        c.category_name,
        p.product_id,
        p.product_name,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS total_revenue
    FROM products p
    JOIN categories c
        ON p.category_id = c.category_id
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY c.category_name, p.product_id, p.product_name
)
SELECT
    category_name,
    product_id,
    product_name,
    total_revenue,
    DENSE_RANK() OVER (PARTITION BY category_name ORDER BY total_revenue DESC) AS category_rank
FROM product_revenue
ORDER BY category_name, category_rank;

-- 8) Products that have never been ordered
SELECT
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL
ORDER BY p.product_id; 

-- 9) Highest revenue-contributing products for each vendor
WITH vendor_product_revenue AS (
    SELECT
        v.vendor_name,
        p.product_id,
        p.product_name,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS total_revenue
    FROM vendors v
    JOIN products p
        ON v.vendor_id = p.vendor_id
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY v.vendor_name, p.product_id, p.product_name
),
ranked_products AS (
    SELECT
        vendor_name,
        product_id,
        product_name,
        total_revenue,
        RANK() OVER (PARTITION BY vendor_name ORDER BY total_revenue DESC) AS revenue_rank
    FROM vendor_product_revenue
)
SELECT
    vendor_name,
    product_id,
    product_name,
    total_revenue
FROM ranked_products
WHERE revenue_rank = 1
ORDER BY vendor_name;

-- 10) Profit margin for each product
SELECT
    product_id,
    product_name,
    price,
    cost_price,
    ROUND(price - cost_price, 2) AS profit_margin,
    ROUND(((price - cost_price) / price) * 100, 2) AS profit_margin_percentage
FROM products
ORDER BY profit_margin DESC;