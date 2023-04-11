
--вивести id усіх юзерів, які робили замовлення
SELECT id FROM users
INTERSECT
SELECT "userId" FROM orders;

--вивести id усіх юзерів, які НЕ робили замовлення
SELECT id FROM users
EXCEPT
SELECT "userId" FROM orders;


