CREATE TABLE IF NOT EXISTS `Cyclistics_Data_052025_052026.all_tripdata` AS
(
  SELECT * FROM `Cyclistics_Data_052025_052026.202505-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202506-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202507-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202508-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202509-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202510-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202511-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202512-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202601-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202602-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202603-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202604-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistics_Data_052025_052026.202605-divvy-tripdata`
);