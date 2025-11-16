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


-- TASK 2 — Total Revenue by Product Category


SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
    ON p.id = oi.product_id
JOIN orders o
    ON o.id = oi.order_id
GROUP BY
    p.category
ORDER BY
    revenue DESC;


-- TASK 3 — Employees Earning Above Their Department Average

SELECT
    e.first_name,
    e.last_name,
    d.name AS department_name,
    e.salary AS employee_salary,
    ROUND(dept.avg_salary, 2) AS department_avg_salary
FROM employees e
JOIN departments d
    ON d.id = e.department_id
JOIN (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept
    ON dept.department_id = e.department_id
WHERE
    e.salary > dept.avg_salary
ORDER BY
    d.name,
    e.salary DESC;