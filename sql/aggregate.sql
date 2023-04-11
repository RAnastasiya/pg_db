--
SELECT sum(quantity)
FROM phones_to_orders;

--
SELECT avg(price)
FROM phones;

--
SELECT avg(price), brand
FROM phones
GROUP BY brand;

--
SELECT count(id), brand
FROM phones
GROUP BY brand;

--
SELECT min(price)
FROM phones;

--
SELECT min(price), brand
FROM phones
GROUP BY brand;

--
SELECT "userId", count(*)
FROM orders
GROUP BY "userId";

--
SELECT sum(price * quantity)
FROM phones
WHERE brand = 'Sony';
