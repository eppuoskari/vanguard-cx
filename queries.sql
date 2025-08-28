USE vanguard;

SELECT DISTINCT(process_step)
FROM data;

-- Select all from demo and join with experimetn to get 'Variation'
SELECT 
	d.*,
    e.Variation
FROM demo AS d
JOIN experiment AS e
	ON d.client_id = e.client_id
WHERE Variation = 'Test';

-- Select all from data and join with experimetn to get 'Variation'
SELECT 
	d.*,
    e.Variation
FROM data AS d
JOIN experiment AS e
	ON d.client_id = e.client_id
WHERE Variation = 'Test';

-- Lets add time spent between steps, based on the visit id and date_time
SELECT 
	d.*,
    e.Variation,
    LAG(date_time) OVER(PARTITION BY visit_id ORDER BY visit_id, date_time) AS 'previous_step',
    date_time - LAG(date_time) OVER(PARTITION BY visit_id ORDER BY visit_id, date_time) AS 'time_spent'
FROM data AS d
JOIN experiment AS e
	ON d.client_id = e.client_id
WHERE Variation = 'Test';

-- Lets add tenure and age data
SELECT 
	da.*,
    de.clnt_tenure_mnth,
    de.clnt_age,
    de.gendr,
    de.num_accts,
    e.Variation,
    LAG(date_time) OVER(PARTITION BY visit_id ORDER BY visit_id, date_time) AS 'previous_step',
    date_time - LAG(date_time) OVER(PARTITION BY visit_id ORDER BY visit_id, date_time) AS 'time_spent'
FROM data AS da
JOIN experiment AS e
	ON da.client_id = e.client_id
JOIN demo AS de
	ON da.client_id = de.client_id
WHERE Variation = 'Test';

-- Master dataset for tableau
SELECT 
	da.*,
	LAG(da.date_time) OVER(PARTITION BY da.visit_id ORDER BY da.visit_id, da.date_time) AS 'previous_step',
    da.date_time - LAG(da.date_time) OVER(PARTITION BY da.visit_id ORDER BY da.visit_id, da.date_time) AS 'time_spent',
    de.clnt_tenure_mnth,
    de.clnt_age,
    de.gendr AS 'gender',
    de.num_accts,
    de.bal AS 'balance',
    de.calls_6_mnth,
    de.logons_6_mnth,
    e.Variation AS 'variation'
FROM data AS da
JOIN experiment AS e
	ON da.client_id = e.client_id
JOIN demo AS de
	ON da.client_id = de.client_id
WHERE e.Variation IS NOT NULL
  AND e.Variation <> '';