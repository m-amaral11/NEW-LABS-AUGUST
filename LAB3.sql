USE sakila;

#List the number of films per category.

SELECT COUNT(film_id) AS amount_of_films, category.name AS film_title
FROM film
	INNER JOIN film_category
	USING(film_id)
	INNER JOIN category
	USING (category_id)
GROUP BY film_title;

#Retrieve the store ID, city, and country for each store.

SELECT store_id, city, country
FROM store
	INNER JOIN address
    USING (address_id)
    INNER JOIN city
    USING (city_id)
    INNER JOIN country
    USING (country_id)
GROUP BY store_id;

#Calculate the total revenue generated by each store in dollars.

SELECT st.store_id, SUM(p.amount) AS total_revenue
FROM payment AS p
INNER JOIN staff AS st USING (staff_id)
GROUP BY st.store_id;

#Determine the average running time of films for each category.

SELECT ROUND(AVG(length)), category.name AS category
FROM film
	INNER JOIN film_category
	USING(film_id)
	INNER JOIN category
	USING (category_id)
GROUP BY category; 

#Identify the film categories with the longest average running time.
SELECT ROUND(AVG(length)) AS average, category.name AS category
FROM film
	INNER JOIN film_category
	USING(film_id)
	INNER JOIN category
	USING (category_id)
GROUP BY category.name
ORDER BY average DESC
LIMIT 1;

#Display the top 10 most frequently rented movies in descending order.

SELECT film.title, COUNT(rental.rental_id) AS rental_count
FROM film
	JOIN inventory ON film.film_id = inventory.film_id
	JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY rental_count DESC
LIMIT 10;

#Determine if "Academy Dinosaur" can be rented from Store 1.
SELECT film.title, store_id
FROM film
	INNER JOIN inventory
    USING (film_id)
    INNER JOIN store
    USING (store_id)
WHERE film.title = "Academy Dinosaur" 
	AND store_id = 1
    LIMIT 1;
    
#Provide a list of all distinct film titles, along with their availability status in the inventory. 
#Include a column indicating whether each title is 'Available' or 'NOT available.' 
#Note that there are 42 titles that are not in the inventory, and this information can be obtained using a CASE statement combined with IFNULL."

SELECT 
    f.title, 
    CASE 
        WHEN COUNT(i.film_id) = 0 THEN 'NOT available'
        ELSE 'Available'
    END AS availability_status
FROM film AS f
LEFT JOIN inventory AS i ON f.film_id = i.film_id
GROUP BY f.title; 
