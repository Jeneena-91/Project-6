-- Find the number of rides for every taxi company whose name contains the words "Yellow" or "Blue" for November 1-7, 2017. Name the resulting variable trips_amount. Group the results by the company_name field.
SELECT 
   cabs.company_name AS company_name,
   COUNT(trips.trip_id) AS trips_amount
FROM 
  trips
INNER JOIN 
  cabs ON cabs.cab_id = trips.cab_id
WHERE 
   (cabs.company_name LIKE '%Yellow%' OR cabs.company_name LIKE '%Blue%' ) AND (CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07')
GROUP BY 
   company_name;
