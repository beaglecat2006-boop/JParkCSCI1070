SELECT f.title, p.amount 
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
ORDER BY p.amount DESC
LIMIT 10;

SELECT sum(p.amount)
FROM payment p
LEFT JOIN customer c

INDEX strategy
