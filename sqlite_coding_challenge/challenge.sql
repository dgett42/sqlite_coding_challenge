SELECT * FROM customers LIMIT 5;

-- TASK 1 — Top 5 Customers by Total Spend

SELECT
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c
JOIN orders o
    ON o.customer_id = c.id
JOIN order_items oi
    ON oi.order_id = o.id
GROUP BY
    c.id, c.first_name, c.last_name
ORDER BY
    total_spend DESC
LIMIT 5;
