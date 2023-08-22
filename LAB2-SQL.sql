-- Task 1:

-- 1.1 Shortest and Longest Movie Durations:
SELECT 
  MIN(length) AS min_duration, 
  MAX(length) AS max_duration 
FROM film;

-- 1.2 Average Movie Duration in Hours and Minutes:
SELECT
  FLOOR(AVG(length) / 60) AS avg_hours,
  ROUND(AVG(length) % 60) AS avg_minutes
FROM film;

-- Task 2:

-- 2.1 Number of Days the Company has been Operating:
SELECT 
  DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating 
FROM rental;

-- 2.2 Retrieve Rental Information with Month and Weekday:
SELECT 
  rental_date, 
  MONTH(rental_date) AS month_of_rental, 
  DAYNAME(rental_date) AS weekday_of_rental 
FROM rental
LIMIT 20;

-- 2.3 Rental Information with 'Weekend' or 'Workday':
SELECT 
  rental_date, 
  CASE 
    WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend' 
    ELSE 'workday' 
  END AS DAY_TYPE
FROM rental;

-- Task 3:

-- Retrieve Film Titles and Rental Duration:
SELECT 
  title, 
  COALESCE(CAST(rental_duration AS CHAR), 'Not Available') AS rental_duration 
FROM film 
ORDER BY title ASC;

-- Concatenated Names and Partial Email:
SELECT 
  CONCAT(first_name, ' ', last_name) AS full_name,
  LEFT(email, 3) AS email_start 
FROM customer 
ORDER BY last_name ASC;

-- Challenge 2:

-- 1.1 Total Number of Films Released:
SELECT 
  COUNT(*) AS total_films 
FROM film;

-- 1.2 Number of Films for Each Rating:
SELECT 
  rating, 
  COUNT(*) AS num_of_films 
FROM film 
GROUP BY rating;

-- 1.3 Number of Films for Each Rating (Sorted):
SELECT 
  rating, 
  COUNT(*) AS num_of_films 
FROM film 
GROUP BY rating 
ORDER BY num_of_films DESC;

-- Employee Performance:
SELECT 
  staff_id, 
  COUNT(*) AS num_of_rentals 
FROM rental 
GROUP BY staff_id;

-- 3.1 Mean Film Duration for Each Rating:
SELECT 
  rating, 
  ROUND(AVG(length), 2) AS avg_duration 
FROM film 
GROUP BY rating 
ORDER BY avg_duration DESC;

-- 3.2 Ratings with Mean Duration Over Two Hours:
SELECT 
  rating, 
  ROUND(AVG(length), 2) AS avg_duration 
FROM film 
GROUP BY rating 
HAVING avg_duration > 120;

-- Non-Repeated Last Names in Actor Table:
SELECT 
  last_name 
FROM actor 
GROUP BY last_name 
HAVING COUNT(*) = 1;
