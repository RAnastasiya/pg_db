

-- 
SELECT count(id) AS count, extract(years FROM age(birthday)) AS age
FROM users
GROUP BY age
HAVING count(id) = 2
ORDER BY count DESC, age DESC;

-- вивести ті бренди, в яких загальна кількість телефонів менше 5000
SELECT sum(quantity) AS sum, brand
FROM phones
GROUP BY brand
HAVING sum(quantity) < 5000
ORDER BY sum DESC;

-- 
SELECT count(id) AS count
FROM users
WHERE "firstName" LIKE 'A%';

SELECT count(id) AS count
FROM users
WHERE "firstName" ILIKE 'a%';

SELECT "firstName"
FROM users
WHERE "firstName" LIKE '%e%';

SELECT "firstName"
FROM users
WHERE "firstName" LIKE '_e%e';

SELECT "firstName"
FROM users
WHERE "firstName" SIMILAR TO '%s{2}%';

--вивести людей з ініціалами AA
SELECT "firstName", "lastName"
FROM users
WHERE "firstName" ILIKE 'A%' AND "lastName" ILIKE 'A%';