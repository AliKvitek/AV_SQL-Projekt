CREATE VIEW v_9 AS
WITH rozdil as 
 (SELECT country,
		life_expectancy as life_expectancy_1965
	FROM life_expectancy
	WHERE `year` = 1965)
SELECT 
	le.country,
	le.life_expectancy as life_expectancy_2005,
	r.life_expectancy_1965,
	ROUND(le.life_expectancy - r.life_expectancy_1965,1) AS age_difference1965_2005
FROM life_expectancy le 
LEFT JOIN rozdil r ON le.country = r.country
WHERE `year` = 2005;
