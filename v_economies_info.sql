-- population_density, GDP, GINI, mortality_under5, median_age_2018

CREATE VIEW v_34567 AS
WITH hdp AS 
	(SELECT 
		country,
		GDP,		
		mortaliy_under5 
	FROM economies e 
	WHERE GDP IS NOT NULL and `year` = '2019'
	GROUP BY country 
),
majetek AS 
	(SELECT 
		country ,
		gini,
		max(`year`) 
	FROM economies e
	WHERE gini IS NOT NULL
	GROUP BY country)
SELECT 
	c.country,
	c.population_density,
	c.median_age_2018,
	hdp.GDP,
	hdp.mortaliy_under5,
	majetek.gini	
	FROM countries c 
LEFT JOIN
	hdp
	ON c.country = hdp.country
LEFT JOIN majetek ON c.country = majetek.country
ORDER BY country; 
