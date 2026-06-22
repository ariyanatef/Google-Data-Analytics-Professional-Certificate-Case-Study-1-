SELECT DISTINCT *
FROM `Cyclistics_Data_052025_052026.all_tripdata`
WHERE start_station_name IS NOT NULL
  AND start_station_id IS NOT NULL
  AND end_station_name IS NOT NULL
  AND end_station_id IS NOT NULL
  AND end_lat IS NOT NULL
  AND end_lng IS NOT NULL;
