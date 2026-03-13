-- 5. Inventory & Supply Chain Analysis
-- 17) Products below reorder level
SELECT
    i.product_id,
    p.product_name,
    i.stock_quantity,
    i.reorder_level,
    i.warehouse_location
FROM inventory i
JOIN products p
    ON i.product_id = p.product_id
WHERE i.stock_quantity < i.reorder_level
ORDER BY i.stock_quantity ASC;

-- 18) Products at risk of stockout based on stock and sales
WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(oi.quantity), 0) AS total_units_sold,
        i.stock_quantity,
        i.reorder_level
    FROM products p
    JOIN inventory i
        ON p.product_id = i.product_id
    LEFT JOIN order_items oi
        ON p.product_id = oi.product_id
    LEFT JOIN orders o
        ON oi.order_id = o.order_id
       AND o.order_status = 'Completed'
    GROUP BY p.product_id, p.product_name, i.stock_quantity, i.reorder_level
)
SELECT
    product_id,
    product_name,
    total_units_sold,
    stock_quantity,
    reorder_level,
    CASE
        WHEN stock_quantity < reorder_level THEN 'Reorder Immediately'
        WHEN stock_quantity <= total_units_sold THEN 'Stockout Risk'
        ELSE 'Healthy'
    END AS stock_status
FROM product_sales
ORDER BY total_units_sold DESC, stock_quantity ASC;

-- 19) Products with high inventory but low sales
WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(CASE WHEN o.order_status = 'Completed' THEN oi.quantity END), 0) AS total_units_sold,
        i.stock_quantity
    FROM products p
    JOIN inventory i
        ON p.product_id = i.product_id
    LEFT JOIN order_items oi
        ON p.product_id = oi.product_id
    LEFT JOIN orders o
        ON oi.order_id = o.order_id
    GROUP BY p.product_id, p.product_name, i.stock_quantity
)
SELECT
    product_id,
    product_name,
    stock_quantity,
    total_units_sold
FROM product_sales
WHERE stock_quantity > 50
  AND total_units_sold < 2
ORDER BY stock_quantity DESC, total_units_sold ASC;

