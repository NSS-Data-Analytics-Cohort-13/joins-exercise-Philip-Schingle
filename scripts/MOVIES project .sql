--Q1.

SELECT film_title, release_year, worldwide_gross
FROM specs AS s
JOIN revenue AS r
on s.movie_id=r.movie_id
ORDER BY worldwide_gross DESC

--Q2.


SELECT film_title, AVG(imdb_rating) AS avg_imbd_rating
FROM specs AS s
JOIN rating AS r
on s.movie_id=r.movie_id
GROUP BY film_title


--Q3.

SELECT film_title, company_name, worldwide_gross AS worldwide_gross,mpaa_rating
FROM specs AS s
JOIN distributors AS d
ON s.domestic_distributor_id= d.distributor_id
JOIN revenue as r
ON s.movie_id=r.movie_id
WHERE mpaa_rating = 'G'
--GROUP BY film_title,company_name,mpaa_rating
ORDER BY worldwide_gross DESC
LIMIT 1

--Q4.

SELECT COUNT (film_title) as film_count,company_name
FROM distributors as d
LEFT JOIN specs as s
ON d.distributor_id=s.domestic_distributor_id
GROUP BY company_name


--Q5. 

SELECT company_name, AVG(film_budget) as avg_budget
FROM distributors as d
JOIN specs as s
ON d.distributor_id=s.domestic_distributor_id
JOIN revenue AS r
on  s.movie_id=r.movie_id
GROUP BY company_name
ORDER BY avg_budget DESC 
LIMIT 5;

 
--Q6

Select --COUNT(s.movie_id),
headquarters, imdb_rating,film_title
FROM distributors as d
JOIN specs as s
ON d.distributor_id=s.domestic_distributor_id
JOIN rating as r
on s.movie_id=r.movie_id
WHERE headquarters  NOT LIKE '%CA%'
--GROUP BY s.movie_id, Headquarters, imdb_rating

--Q6a-- DIRT DANCING


--Q7. together
SELECT film_title,AVG(imdb_rating) as avg_rating, length_in_min
FROM specs as s
JOIN rating as r
on s.movie_id=r.movie_id
WHERE length_in_min > 120 OR length_in_min < 120
GROUP BY length_in_min, film_title
ORDER BY avg_rating DESC, length_in_min DESC



--Q7. split
SELECT AVG(imdb_rating)
FROM specs as s
JOIN rating as r
on s.movie_id=r.movie_id
WHERE length_in_min > 120 

SELECT AVG(imdb_rating)
FROM specs as s
JOIN rating as r
on s.movie_id=r.movie_id
WHERE length_in_min < 120 