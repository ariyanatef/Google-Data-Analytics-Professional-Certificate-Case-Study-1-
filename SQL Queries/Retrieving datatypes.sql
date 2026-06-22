--Retrieving different unique bike types--
SELECT DISTINCT rideable_type, COUNT(rideable_type) AS trip_type
FROM `Cyclistics_Data_052025_052026.all_tripdata`
GROUP BY rideable_type;

--Retrieving different member_types--
SELECT DISTINCT member_casual, COUNT(*) AS count_member_type
FROM `Cyclistics_Data_052025_052026.all_tripdata`
GROUP BY member_casual;
