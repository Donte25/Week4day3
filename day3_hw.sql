--1. List all customers who live in Texas (use
--JOINs)

SELECT * 
FROM customer
INNER JOIN address AS a
ON customer.address_id = a.address_id
WHERE district = 'Texas';

 
--2. Get all payments above  $6.99 with the Customer's Full
--Name

SELECT amount, first_name, last_name
FROM payment
LEFT JOIN customer
on payment.customer_id = customer.customer_id
WHERE amount > 6.99 ;

--3. Show all customers names who have made payments over $175(use
--subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 0
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) DESC
);


--4. List all customers that live in Nepal (use the city
--table)

SELECT *
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
WHERE city = 'Nepal';

--5. Which staff member had the most
--transactions? Mike Hillyer

SELECT amount, first_name, last_name
FROM staff as s
INNER JOIN payment 
ON s.staff_id = payment.staff_id
ORDER BY amount DESC;

--6. How many movies of each rating are
--there?

SELECT COUNT(rating)
FROM movies

--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)

SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    ORDER BY amount DESC
);

--8. How many free rentals did our stores give away?

SELECT 