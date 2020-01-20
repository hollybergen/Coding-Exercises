use sakila;

SELECT * FROM sakila.category -- category_id, name(GENRE)
SELECT * FROM sakila.film_category -- category_id, film_id
SELECT * FROM sakila.inventory -- inventory_id, film_id, 
SELECT * FROM sakila.rental -- rental_id, inventory_id
SELECT * FROM sakila.payment -- payment_id, rental_id (AMOUNT)

SELECT name, sum(amount)
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN inventory i ON fc.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY name
ORDER BY amount DESC
LIMIT 5

SELECT * FROM sakila.payment

CREATE VIEW total_revenue AS
SELECT sum(amount), payment_date
WHERE p.payment_date LIKE "2005"

SELECT payment_date as Year_Month,
	SUM(amount)
    FROM payment
    WHERE p.payment_date LIKE "2005"
    ORDER BY Year_Month

SELECT YEAR(payment_date) as year,
	MONTH(payment_date) as month,
	SUM(amount) AS total_revenue,
	COUNT(*) as number_transactions
FROM payment
GROUP BY YEAR(payment_date), MONTH(payment_date)
ORDER BY YEAR(payment_date), MONTH(payment_date)

