-- 1. Add 'status' column and update based on rental duration
ALTER TABLE rental ADD COLUMN status VARCHAR(20);

UPDATE rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
SET r.status = CASE 
    WHEN DATEDIFF(r.return_date, r.rental_date) > f.rental_duration THEN 'Late'
    WHEN DATEDIFF(r.return_date, r.rental_date) < f.rental_duration THEN 'Early'
    ELSE 'On Time'
END;

-- 2. Total payments for Kansas City or Saint Louis
SELECT c.city, SUM(p.amount) AS total_payments
FROM payment p
JOIN customer cu ON p.customer_id = cu.customer_id
JOIN address a ON cu.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
WHERE c.city IN ('Kansas City', 'Saint Louis')
GROUP BY c.city;

-- 3. Number of films in each category
SELECT c.name AS category_name, COUNT(fc.film_id) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;

-- 4. Relationship Explanation:
-- The 'category' table is a master list of genres.
-- The 'film_category' table is a junction table that handles the many-to-many 
-- relationship between films and categories.

-- 5. Films returned May 15 to 31, 2005
SELECT f.film_id, f.title, f.length
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.return_date BETWEEN '2005-05-15' AND '2005-05-31 23:59:59';

-- 6. Movies rented below average price
SELECT film_id, title, rental_rate
FROM film
WHERE rental_rate < (SELECT AVG(rental_rate) FROM film);

-- 7. Count of films by status
SELECT status, COUNT(*) AS total_rentals
FROM rental
GROUP BY status;

-- 8. Film duration and percentile (Window Function)
SELECT title, length,
       PERCENT_RANK() OVER (ORDER BY length) AS duration_percentile
FROM film;

-- 9. Explain Plan Comparison:
-- EXPLAIN SELECT * FROM film WHERE rental_rate < (SELECT AVG(rental_rate) FROM film);
-- EXPLAIN SELECT status, COUNT(*) FROM rental GROUP BY status;
-- Observation: The subquery requires a two-step scan (aggregate then filter), 
-- while the status group-by relies on a single table scan (or index if available).


