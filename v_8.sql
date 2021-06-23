CREATE VIEW v_8 AS
SELECT r.country,
	   r.religion,
	   r.population,
	   c.population AS total_population, 
	   ROUND(r.population/c.population *100,2) AS percentage
FROM religions r 
LEFT JOIN countries c ON r.country = c.country 
WHERE `year` = 2020;
