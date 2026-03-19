SELECT first_name, last_name 
FROM customer 
WHERE last_name LIKE 'T%' 
ORDER BY first_name ASC;

SELECT * 
FROM rental 
WHERE return_date >= '2005-05-28 00:00:00' 
  AND return_date <= '2005-06-01 23:59:59';

SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC
LIMIT 10;

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent ASC;



SELECT 
    a.first_name || ' ' || a.last_name AS actor_full_name, 
    COUNT(fa.film_id) AS movie_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.release_year = 2006
GROUP BY a.actor_id, actor_full_name
ORDER BY movie_count DESC;


