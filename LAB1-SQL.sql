USE sakila;
SHOW TABLES;

SELECT *
FROM actor;

SELECT *
FROM film;

SELECT *
FROM customer;

SELECT title
FROM film;

SELECT name AS language
FROM language;

SELECT first_name
FROM staff;

SELECT DISTINCT(release_year)
FROM film;

SELECT COUNT(store_id)
FROM store;

SELECT *
FROM staff;

SELECT COUNT(inventory_id)
FROM inventory;

SELECT COUNT(rental_id)
FROM rental;

SELECT DISTINCT(last_name)
FROM actor;

SELECT length, title
FROM film
ORDER BY length DESC
LIMIT 10;

SELECT *
FROM actor
WHERE first_name IN ("SCARLETT");

SELECT title
FROM film
WHERE title LIKE ("ARMAGEDDON%")
	AND length > 100;

SELECT COUNT(film_id)
FROM film
WHERE special_features LIKE ("%Behind the Scenes");