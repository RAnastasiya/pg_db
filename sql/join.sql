
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

-- вивести телефони які купляли
SELECT p.id
FROM phones AS p
JOIN phones_to_orders AS pto ON p.id = pto."phoneId"
GROUP BY p.id
ORDER BY p.id;

-- вивести бренди телефонів які купляли
SELECT p.brand
FROM orders AS o
JOIN phones_to_orders AS pto ON o.id = pto."orderId"
JOIN phones AS p ON pto."phoneId" = p.id
GROUP BY p.brand;

-- вивести бренди телефонів які НЕ купляли
SELECT p.brand
FROM phones AS p
LEFT OUTER JOIN phones_to_orders AS pto ON p.id = pto."phoneId"
WHERE pto."phoneId" IS NULL;

--вивести моделі телефонів, які HE купляли
SELECT p.model
FROM phones AS p
LEFT OUTER JOIN phones_to_orders AS pto ON p.id = pto."phoneId"
WHERE pto."phoneId" IS NULL;

--вивести пошти юзері, які не робили замовлення
SELECT u.email
FROM users AS u
LEFT OUTER JOIN orders AS o ON u.id = o."userId"
WHERE o."userId" IS NULL;

SELECT u.email
FROM orders AS o
RIGHT OUTER JOIN users AS u ON u.id = o."userId"
WHERE o."userId" IS NULL;

--
SELECT u.email
FROM users AS u
LEFT OUTER JOIN orders AS o ON u.id = o."userId"
WHERE o."userId" IS NULL;

--вивести пошту користувачів, які купляли айфон
SELECT u.email. p.brand
FROM users AS u
JOIN orders AS o ON u.id = o."userId"
JOIN phones_to_orders AS pto ON o.id = pto."orderId"
JOIN phones AS p ON pto."phoneId" = p.id
WHERE p.brand ILIKE 'iphone'

--вивести пошту користувачів, які зробили тільки по одному замовленню
SELECT u.email, count(o.id)
FROM users AS u
JOIN orders AS o ON u.id = o."userId"
GROUP BY u.email
HAVING count(o.id) = 1

--вивести усі айді замовлень і пошту користувачів, що купували телефон з id=8

SELECT o.id, u.email
FROM users AS u
JOIN orders AS o ON u.id = o."userId"
JOIN phones_to_orders AS pto ON o."userId" = pto."orderId"
WHERE pto."phoneId" = 8

-- вивести модель найпопулярнішого телефона - якого продалу більшу кількість
SELECT p.model, sum(pto.quantity) AS total
FROM orders AS o
JOIN phones_to_orders AS pto ON o.id = pto."orderId"
JOIN phones AS p ON pto."phoneId" = p.id
GROUP BY p.model
ORDER BY total DESC
LIMIT 1;


--
SELECT u.email, count(p.model)
FROM users AS u
JOIN orders AS o ON u.id = o."userId"
JOIN phones_to_orders AS pto ON o.id = pto."orderId"
JOIN phones AS p ON pto."phoneId" = p.id
GROUP BY u.email
ORDER BY u.email

