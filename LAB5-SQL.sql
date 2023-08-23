-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT COUNT(*) AS copies_in_inventory
FROM inventory 
WHERE film_id = (SELECT film_id 
				FROM film 
                WHERE title = 'Hunchback Impossible');

-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT title AS films_longer_than_avg
FROM film 
WHERE length > (SELECT AVG(length) FROM film);

-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT actor_id, first_name, last_name 
FROM actor 
WHERE actor_id IN (SELECT actor_id 
					FROM film_actor 
					WHERE film_id = (SELECT film_id 
									FROM film 
                                    WHERE title = 'Alone Trip'));

-- 4. Identify all movies categorized as family films.
SELECT film_id, title AS Family_Films
FROM film 
WHERE film_id IN (SELECT film_id 
					FROM film_category 
					WHERE category_id = (SELECT category_id 
											FROM category 
                                            WHERE name = 'Family'));

-- 5. Retrieve the name and email of customers from Canada using subqueries.
SELECT first_name, last_name, email 
FROM customer 
WHERE address_id IN (SELECT address_id 
					FROM address 
					WHERE city_id IN (SELECT city_id 
										FROM city 
										WHERE country_id = (SELECT country_id 
															FROM country 
                                                            WHERE country = 'Canada')));

-- 5. Retrieve the name and email of customers from Canada using joins.
SELECT first_name, last_name, email 
FROM customer 
	JOIN address 
	USING(address_id)
	JOIN city 
	USING (city_id)
	JOIN country 
    USING (country_id)
WHERE country = 'Canada';

-- 6. Determine which films were starred by the most prolific actor.
SELECT title, actor_id
FROM film 
JOIN film_actor
USING(film_id) 
WHERE actor_id = (SELECT actor_id 
					FROM film_actor
    GROUP BY actor_id
    ORDER BY COUNT(film_id) DESC
    LIMIT 1);

-- 7. Find the films rented by the most profitable customer.


-- 8. Retrieve the client_id and the total_amount_spent 
#of those clients who spent more than the average of the total_amount spent by each client.
