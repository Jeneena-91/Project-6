-- Print the company_name field. Find the number of taxi rides for each taxi company for November 15-16, 2017, name the resulting field trips_amount, and print it, too. Sort the results by the trips_amount field in descending order.
SELECT 
  cabs.company_name AS company_name,
  COUNT(trips.trip_id) AS trips_amount
FROM 
   trips
   INNER JOIN cabs ON cabs.cab_id=trips.cab_id
WHERE 
   CAST(trips.start_ts AS date) BETWEEN '2017-11-15' AND '2017-11-16'
GROUP BY 
    company_name 
ORDER BY 
     trips_amount DESC;
