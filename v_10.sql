CREATE VIEW v_10 AS
WITH avg_temp AS 
(SELECT 
	`date`,
	city,
	AVG(CAST(REPLACE(temp, '°c', '') as integer)) as avg_temp
FROM weather w 
WHERE (`time` BETWEEN '06:00' AND '21:00') AND city IS NOT NULL 
GROUP BY `date`, city 
),
gust AS(
SELECT 
	`date`,
	city,
	max(gust) AS maxgust
FROM weather w 
WHERE city IS NOT NULL 
GROUP BY `date` , city 
),
hours AS (SELECT
	`date`,
	time,	
	city,
	count(rain)*3 AS hours_of_rainfall
FROM weather w 
WHERE rain NOT LIKE "0.0 mm" AND city IS NOT NULL 
GROUP BY `date`, city 
)
SELECT CAST(avt.date AS date) AS `date` ,
	avt.city,
	avt.avg_temp,
	gust.maxgust,
	hours.hours_of_rainfall
FROM avg_temp avt
LEFT JOIN gust ON avt.city = gust.city
AND avt.date = gust.date
LEFT JOIN hours ON avt.city = hours.city
AND avt.date = hours.date;


