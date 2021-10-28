USE sakila;
-- LAB 2.7 SQL Join

-- Task 1 How many films are there for each of the categories in the category table. 
SELECT c.category_id, name, COUNT(film_id)
 FROM sakila.category c
 JOIN sakila.film_category fc
 ON c.category_id = fc.category_id
 GROUP BY c.category_id;
 
 -- Task 2 Display the total amount rung up by each staff member in August of 2005.
 SELECT * from payment;
 
 SELECT s.staff_id, sum(amount) AS total_amount, month(payment_date), year(payment_date)
 FROM sakila.staff s
 JOIN sakila.payment p
 ON s.staff_id = p.staff_id
 WHERE month(payment_date) = 8 AND year(payment_date) = 2005
 GROUP BY s.staff_id;
 
  -- Task 3 Which actor appeared in the most films?
  
  SELECT a.actor_id, first_name, last_name, count(film_id)
  FROM sakila.actor a
  JOIN sakila.film_actor fa
  ON a.actor_id = fa.actor_id
  GROUP BY a.actor_id;
  
  -- Task 4 Most active customer( rented most # of films)
Select * FROM rental;

SELECT c.customer_id, c.last_name, c.first_name, count(r.rental_id) AS films_rented
FROM sakila.rental r
JOIN sakila.customer c
ON r.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY count(r.rental_id) DESC
LIMIT 1;

-- Task 5 Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id
GROUP BY first_name;

-- Task 6 List each film and the number of actors who are listed for that film.
SELECT f.film_id, f.title, count(fa.actor_id) AS number_of_actors
FROM sakila.film_actor fa
JOIN sakila.film f
ON fa.film_id = f.film_id
GROUP BY f.film_id;

-- Task 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.customer_id, c.last_name, c.first_name, SUM(p.amount)
FROM sakila.payment p
JOIN sakila.customer c
ON p.customer_id = c.customer_id
GROUP BY c.last_name
ORDER BY c.last_name ASC;

-- Task 8 List number of films per category.
SELECT c.category_id, c.name, COUNT(f.film_id)
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.category_id;







 
 
