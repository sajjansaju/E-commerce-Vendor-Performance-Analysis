-- 4. Sales Trend Analysis
-- 14) Monthly revenue trend for the platform
SELECT
    TO_CHAR(DATE_TRUNC('month', o.order_date), 'YYYY-MM') AS order_month,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY DATE_TRUNC('month', o.order_date);

-- 15) Month with the highest sales revenue
SELECT
    TO_CHAR(DATE_TRUNC('month', o.order_date), 'YYYY-MM') AS order_month,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY monthly_revenue DESC
LIMIT 1;

-- 16) Month-on-month revenue growth
WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', o.order_date) AS order_month,
        SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY DATE_TRUNC('month', o.order_date)
)
SELECT
    TO_CHAR(order_month, 'YYYY-MM') AS order_month,
    ROUND(revenue, 2) AS current_month_revenue,
    ROUND(LAG(revenue) OVER (ORDER BY order_month), 2) AS previous_month_revenue,
    ROUND(revenue - LAG(revenue) OVER (ORDER BY order_month), 2) AS revenue_change,
    ROUND(
        ((revenue - LAG(revenue) OVER (ORDER BY order_month))
        / NULLIF(LAG(revenue) OVER (ORDER BY order_month), 0)) * 100,
        2
    ) AS growth_percentage
FROM monthly_revenue
ORDER BY order_month;
