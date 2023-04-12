
--1
SELECT pto."orderId", sum(pto.quantity * p.price)
FROM phones_to_orders AS pto
JOIN phones AS p ON pto."phoneId" = p.id 
GROUP BY pto."orderId"

--2
SELECT avg(orders_check.check)
FROM (
    SELECT pto."orderId", sum(pto.quantity * p.price) AS check
    FROM phones_to_orders AS pto
    JOIN phones AS p ON pto."phoneId" = p.id 
    GROUP BY pto."orderId"
) AS orders_check

-- 3
SELECT orders_check.*
FROM (
    SELECT pto."orderId", sum(pto.quantity * p.price) AS check
    FROM phones_to_orders AS pto
    JOIN phones AS p ON pto."phoneId" = p.id 
    GROUP BY pto."orderId"
) AS orders_check
WHERE orders_check.check > (
    SELECT avg(orders_check.check)
    FROM (
        SELECT pto."orderId", sum(pto.quantity * p.price) AS check
        FROM phones_to_orders AS pto
        JOIN phones AS p ON pto."phoneId" = p.id 
        GROUP BY pto."orderId"
    ) AS orders_check
)
--------------------------------
WITH orders_check AS (
    SELECT pto."orderId", sum(pto.quantity * p.price) AS check
    FROM phones_to_orders AS pto
    JOIN phones AS p ON pto."phoneId" = p.id 
    GROUP BY pto."orderId"
)
SELECT oc.*
FROM orders_check AS oc
WHERE oc.check > (SELECT avg(oc.check) FROM orders_check AS oc)

----------------------------------
-- отримати пошту користувачів у яких кількість замовлень менше середньої кількості
WITH count_orders AS (
    SELECT u.email AS email, count(o.id) AS count
    FROM users AS u
    JOIN orders AS o ON u.id = o."userId"
    GROUP BY u.email
)
SELECT co.email
FROM count_orders AS co
WHERE co.count < (SELECT avg(co.count) FROM count_orders AS co)