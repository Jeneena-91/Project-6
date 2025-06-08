-- For November 1-7, 2017, the most popular taxi companies were Flash Cab and Taxi Affiliation Services. Find the number of rides for these two companies and name the resulting variable trips_amount. Join the rides for all other companies in the group "Other." Group the data by taxi company names. Name the field with taxi company names company. Sort the result in descending order by trips_amount.
SELECT 
 CASE WHEN cabs.company_name ='Flash Cab'THEN 'Flash Cab'
      WHEN cabs.company_name ='Taxi Affiliation Services' 
      THEN 'Taxi Affiliation Services'
      ELSE 'Other'
END AS company,
COUNT(trips.trip_id) AS trips_amount
FROM 
   trips
INNER JOIN cabs ON cabs.cab_id=trips.cab_id
WHERE 
  CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY 
   company
ORDER BY 
    trips_amount DESC;
