--3.    Inside sakila db modify 2 film records values
UPDATE film SET release_year=2008, original_language_id=5, length=95 WHERE film_id=8;

UPDATE film SET title="BIOSHOCK INFINITE", language_id=2, release_year=2010, original_language_id=3  WHERE film_id=14;

SELECT * FROM film;

--4.	List of movies by actor

SELECT
	a.first_name AS "First name",
    a.last_name AS "Last name",
    f.title AS "Movie title"
FROM
	actor a
INNER JOIN
	film_actor fa
ON
	a.actor_id=fa.actor_id
INNER JOIN
	film f
ON
	fa.film_id=f.film_id;


--5.	Count number of movies per actor

SELECT 
    a.actor_id AS "ID", 
    a.first_name AS "First name", 
    a.last_name AS "Last name", 
    COUNT(f.film_id)  AS "Total of movies" 
FROM 
    actor a 
RIGHT JOIN 
    film_actor f 
ON 
    a.actor_id=f.actor_id 
GROUP BY 
    f.actor_id;

--6.	Count movie languages

SELECT 
	l.name, 
    COUNT(f.film_id) AS "Total of movies"
FROM 
	film f 
LEFT JOIN 
    language l 
ON 
	l.language_id=f.language_id 
GROUP BY 
	f.language_id;

--7.	Calculate average cost for replacement of a film

SELECT AVG(replacement_cost) FROM film;

--8.	Do a store procedure to update the film

CREATE PROCEDURE `spSakila_UpdateRentalDetailsOfFilms`(
	IN filmID INT,
    IN rentalDuration TINYINT,
    IN rentalRate DECIMAL(4,2),
    IN replacementCost DECIMAL(5,2)
    )
BEGIN
	UPDATE 
		film 
    SET
		rental_duration=rentalDuration,
        rental_rate=RentalRate,
        replacement_cost=replacementCost
	WHERE
		film_id=filmID;
	SELECT * from film where film_id=filmID;
END