--This is used to count the rows--
SELECT COUNT (*) AS total_rows
FROM `Cyclistics_Data_052025_052026.all_tripdata`;

--This is used to find the first 15 rows--
SELECT * FROM `Cyclistics_Data_052025_052026.all_tripdata` LIMIT 15;

--Checking the primary key--
SELECT column_name, data_type
FROM `Cyclistics_Data_052025_052026`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'all_tripdata';