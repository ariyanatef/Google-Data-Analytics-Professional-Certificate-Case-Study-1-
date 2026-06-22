--Checking for duplicates--
SELECT COUNT (ride_id) - COUNT (DISTINCT ride_id) AS duplicate_rows
FROM `Cyclistics_Data_052025_052026.all_tripdata`;
