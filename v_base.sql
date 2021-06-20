CREATE VIEW v_base AS
SELECT
	cbd.country,
	cbd.`date`,
	cbd.confirmed,
	c.capital_city,
	CASE WHEN WEEKDAY(`date`) in (5,6) THEN '0'
		 ELSE '1' END AS week,
	CASE WHEN date < '2020-03-20' THEN '3'
		 WHEN date < '2020-06-20' THEN '0'
		 WHEN date < '2020-09-22' THEN '1'
	     WHEN date < '2020-12-21' THEN '2' 
	     WHEN date < '2021-03-20' THEN '3'
		 ELSE '0' END AS season
FROM covid19_basic_differences cbd 
LEFT JOIN countries c ON cbd.country = c.country 
ORDER BY `date`, country ASC;
