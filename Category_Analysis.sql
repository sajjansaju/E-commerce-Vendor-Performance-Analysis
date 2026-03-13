-- 3. Category Analysis
-- 11) Categories generating the highest total revenue
SELECT
    c.category_id,
    c.category_name,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS total_revenue
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;

-- 12) Average product price in each category
SELECT
    c.category_id,
    c.category_name,
    ROUND(AVG(p.price), 2) AS avg_product_price
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY avg_product_price DESC;

-- 13) Rank categories based on total quantity sold
WITH category_quantity AS (
    SELECT
        c.category_name,
        SUM(oi.quantity) AS total_quantity_sold
    FROM categories c
    JOIN products p
        ON c.category_id = p.category_id
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY c.category_name
)
SELECT
    category_name,
    total_quantity_sold,
    RANK() OVER (ORDER BY total_quantity_sold DESC) AS category_rank
FROM category_quantity
ORDER BY category_rank;
