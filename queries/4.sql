--Retrieve the identifiers of the O'Hare and Loop neighborhoods  from the neighborhoods table.
SELECT
    neighborhood_id,
    name
FROM 
    neighborhoods
WHERE 
    name LIKE '%Hare' OR name LIKE 'Loop';

-- For each hour, retrieve the weather condition records from the weather_records table. Using the CASE operator, break all hours into two groups: Bad if the description field contains the words rain or storm, and Good for others. Name the resulting field weather_conditions. The final table must include two fields: date and hour (ts) and weather_conditions.
SELECT 
     ts,
   CASE 
     WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
     ELSE 'Good'
    END AS weather_conditions
FROM weather_records;

-- Retrieve from the trips table all the rides that started in the Loop (pickup_location_id: 50) on a Saturday and ended at O'Hare (dropoff_location_id: 63). Get the weather conditions for each ride. Use the method you applied in the previous task. Also, retrieve the duration of each ride. Ignore rides for which data on weather conditions is not available.

--The table columns should be in the following order:

--start_ts
--weather_conditions
--duration_seconds
--Sort by trip_id.
ELECT 
  trips.start_ts AS start_ts,
CASE
 WHEN weather_records.description LIKE '%rain%' OR weather_records.description LIKE '%storm%' THEN 'Bad'
     ELSE 'Good'
END AS weather_conditions,
trips.duration_seconds AS duration_seconds
FROM 
 trips
INNER JOIN
 weather_records ON weather_records.ts=trips.start_ts
WHERE 
  trips.pickup_location_id = 50
AND 
  trips.dropoff_location_id =63
AND 
  EXTRACT(DOW FROM trips.start_ts)=6
ORDER BY 
    trip_id;
