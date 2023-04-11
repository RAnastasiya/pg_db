
-- INNER JOIN

SELECT users.id, email
FROM users 
JOIN orders ON users.id = orders."userId"

SELECT u.id, email
FROM users AS u
JOIN orders AS o ON u.id = o."userId"

SELECT u.id, email
FROM users AS u
JOIN orders AS o ON u.id = o."userId"
WHERE u.id%2 = 1;

SELECT u.id, email
FROM users AS u
JOIN orders AS o ON u.id = o."userId"
WHERE u.id%2 = 1
GROUP BY u.id;

SELECT u.id, email, count(*)
FROM users AS u
JOIN orders AS o ON u.id = o."userId"
WHERE u.id%2 = 1
GROUP BY u.id, email;

SELECT u.id, email, count(*)
FROM users AS u
JOIN orders AS o ON u.id = o."userId"
WHERE u.id%2 = 1
GROUP BY u.id, email
HAVING count(*) > 3;

-- всі id замовлень, які купували Sony
SELECT o.id, p.brand, p.model
FROM orders AS o
JOIN phones_to_orders AS pto ON o.id = pto."orderId"
JOIN phones AS p ON pto."phoneId" = p.id
WHERE p.brand = 'Sony'
ORDER BY o.id, p.model;

-- кількість моделей Sony для кожного замовлення
SELECT o.id, count(p.model)
FROM orders AS o
JOIN phones_to_orders AS pto ON o.id = pto."orderId"
JOIN phones AS p ON pto."phoneId" = p.id
WHERE p.brand = 'Sony'
GROUP BY o.id
ORDER BY o.id;

SELECT pto."orderId", count(p.model)
FROM phones_to_orders AS pto
JOIN phones AS p ON pto."phoneId" = p.id
WHERE p.brand ILIKE 'Sony'
GROUP BY pto."orderId"
ORDER BY pto."orderId";

-- кількість проданих тел по кожній моделі
SELECT sum(pto.quantity) AS amount, p.model
FROM phones_to_orders AS pto
JOIN phones AS p ON pto."phoneId" = p.id
GROUP BY p.model;

SELECT sum(pto.quantity) AS amount, p.model, p.brand
FROM phones_to_orders AS pto
JOIN phones AS p ON pto."phoneId" = p.id
GROUP BY p.model, p.brand
ORDER BY amount
LIMIT 1;