CREATE TABLE t_alena_vitkova_projekt_SQL_final AS
(SELECT v1.date,
	v1.week,
	v1.season,
	v1.country,
	v1.confirmed,
	ct.tests_performed,
	v8.total_population,
	ROUND(v2.population_density,2),
	v2.GDP,
	v2.gini,
	v2.mortaliy_under5,
	v2.median_age_2018,
	v8.religion,
	v8.percentage,
	v9.age_difference1965_2005,
	v.avg_temp,
	v.hours_of_rainfall,
	v.maxgust 
	FROM v_base v1
LEFT JOIN v_34567 v2
ON v1.country = v2.country
LEFT JOIN v_10 v 
ON v1.capital_city = v.city AND v1.date = v.date
LEFT JOIN v_8 v8
ON v1.country = v8.country
LEFT JOIN v_9 v9
ON v1.country = v9.country
LEFT JOIN covid19_tests ct 
ON v1.country = ct.country AND v1.date = ct.date
ORDER BY date);
