# Case Study 1: How does a bike-share navigate speedy success
Introduction:

Welcome to the Cyclistic bike-share analysis case study! In this case study, you work for a
fictional company, Cyclistic, along with some key team members. In order to answer the
business questions, follow the steps of the data analysis process: Ask, Prepare, Process,
Analyze, Share, and Act. Along the way, the Case Study Roadmap tables — including guiding
questions and key tasks — will help you stay on the right path.


Scenario:

You are a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share
company in Chicago. The director of marketing believes the company’s future success
depends on maximizing the number of annual memberships. Therefore, your team wants to
understand how casual riders and annual members use Cyclistic bikes differently. From these
insights, your team will design a new marketing strategy to convert casual riders into annual
members. But first, Cyclistic executives must approve your recommendations, so they must be
backed up with compelling data insights and professional data visualizations.


Characters and teams:

● Cyclistic: A bike-share program that features more than 5,800 bicycles and 600
docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand
tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities
and riders who can’t use a standard two-wheeled bike. The majority of riders opt for
traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more
likely to ride for leisure, but about 30% use the bikes to commute to work each day.

● Lily Moreno: The director of marketing and your manager. Moreno is responsible for
the development of campaigns and initiatives to promote the bike-share program.
These may include email, social media, and other channels.

● Cyclistic marketing analytics team: A team of data analysts who are responsible for
collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy.
You joined this team six months ago and have been busy learning about Cyclistic’s
mission and business goals—as well as how you, as a junior data analyst, can help
Cyclistic achieve them.

● Cyclistic executive team: The notoriously detail-oriented executive team will decide
whether to approve the recommended marketing program.


About the company:

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown
to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across
Chicago. The bikes can be unlocked from one station and returned to any other station in the
system anytime.
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to
broad consumer segments. One approach that helped make these things possible was the
flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships.
Customers who purchase single-ride or full-day passes are referred to as casual riders.
Customers who purchase annual memberships are Cyclistic members.
Cyclistic’s finance analysts have concluded that annual members are much more profitable
than casual riders. Although the pricing flexibility helps Cyclistic attract more customers,
Moreno believes that maximizing the number of annual members will be key to future growth.
Rather than creating a marketing campaign that targets all-new customers, Moreno believes
there is a solid opportunity to convert casual riders into members. She notes that casual riders
are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.
Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into
annual members. In order to do that, however, the team needs to better understand how
annual members and casual riders differ, why casual riders would buy a membership, and how
digital media could affect their marketing tactics. Moreno and her team are interested in
analyzing the Cyclistic historical bike trip data to identify trends.


# Ask
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?


Moreno has assigned you the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?
You will produce a report with the following deliverables:
1. A clear statement of the business task
2. A description of all data sources used
3. Documentation of any cleaning or manipulation of data
4. A summary of your analysis
5. Supporting visualizations and key findings
6. Your top three recommendations based on your analysis
Use the following Case Study Roadmap as a guide.

# Prepare: 
*Sidenote: I did make separate labeled tabs for the SQL queries to ensure there would be no confusion with
what I was working with. While I would highly recommend you to do so, this is not a requirement.

1. I downloaded the last 12 months of trip data (in my case from May 2025-May 2026).
2. I then created a folder in my desktop to put the last 12 months of csv files.
3. I opened BigQuery Sandbox and created a new projected named "Cyclistics Data Analysis"
4. I uploaded the 202505 into BigQuery
5. I was prompted to create a new dataset which I called "CyclisticsData"
6. I was then prompted to created a table which I called 202505-divvy-tripdata (how you name your table is up to you, but keep it consistent with each 
7. Steps 4-6 was repeated, changing table names to match the csv files being downloaded.

   a. For files larger than 100MB, upload them onto google drive, open with google
sheets, press continue with connected sheets if it says file too large, and once it
says, “Seamlessly access large files using Connected Sheets & BigQuery”, press
continue to upload the dataset, select your project name and dataset, then press
continue.

8. To combine the files into a singular data table, I used this query:
```sql
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
```
9. After running this query, click on "Go to Table" to confirm the table has been created.


10. Once the table has been created, let's run this query to find out how many rows are in this tab:
```sql
SELECT COUNT (*) AS total_rows
FROM `Cyclistics_Data_052025_052026.all_tripdata`;
As you can see, there are a total of 6,351,159 rows.
```


11. To understand this dataset a little better, we want to see the first 15 rows of this query:
```sql
SELECT * FROM `Cyclistics_Data_052025_052026.all_tripdata` LIMIT 15;
```


12. We must check what the dataset primary keys are:
```sql
SELECT column_name, data_type
FROM `Cyclistics_Data_052025_052026`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'all_tripdata';

According to further research, the ride_id is the primary key and these other column names
represent the foreign keys that identify the pieces of data.
```

# Clean Data
13. In Step 11, we saw the first 15 rows and discovered a lot of null values. We must clean that up
alongside the rest of the null values on the dataset. To find out where the remaining null values are, we use this query:
```sql
SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM `Cyclistics_Data_052025_052026.all_tripdata`;
```
Here we can see that there are null values in start_station_name, start_station_id, end_station_name, end_station_id,
end_lat, & end_lng. The zeroes in the other column means that they do NOT have null values.


13a. Because of the limitations of BigQuery Sandbox, I have decided to filter out the null values to ensure accurate results.
If I was using another SQL platform, I'd most likely delete the nulls. Replacing them with placeholders might impact the
accuracy due to not having the exact data needed to perform the analysis. I used this query to filter:
```sql
SELECT *
FROM 'Cyclistics_Data_052025_052026.all_tripdata'
WHERE start_station_name IS NOT NULL
  AND start_station_id IS NOT NULL
  AND end_station_name IS NOT NULL
  AND end_station_id IS NOT NULL
  AND end_lat IS NOT NULL
  AND end_lng IS NOT NULL;
```

14. Now we have to find out if there are any duplicates on the ride_id primary key. Using this query,
we have 35 queries we must remove. This will be addressed in Step 16:
```sql
SELECT COUNT (ride_id) - COUNT (DISTINCT ride_id) AS duplicate_rows
FROM `Cyclistics_Data_052025_052026.all_tripdata`;
```

15. Now we need to retrieve the records of the rideable_type and member_casual volumn and find out their unique values:

--Retrieving different unique bike types--
```sql
SELECT DISTINCT rideable_type, COUNT(rideable_type) AS trip_type
FROM `Cyclistics_Data_052025_052026.all_tripdata`
GROUP BY rideable_type;

--Retrieving different member_types--

SELECT DISTINCT member_casual, COUNT(*) AS count_member_type
FROM `Cyclistics_Data_052025_052026.all_tripdata`
GROUP BY member_casual;
```
In this dataset (and this can change if you are using an older version or if this is being done in the future) that
rideable_type consists of electric_bike and classic_bike with 4,218,872 & 2,132,287 trip_type values respectively.
We also see in member_casual that the two rows are member and casual (this shouldn't change but the values might depending on your dataset)
which have 4,068,257 & 2,282,902 count_member_type respectively.


16. In Step 13a, we filtered out the NULL values. In Step 14, we found out there were 35 duplicates on ride_id.
So I have decided to combine the NULL values query and the SELECT DISTINCT query in order to make the code more readable
and consistent.
```sql
SELECT DISTINCT *
FROM `Cyclistics_Data_052025_052026.all_tripdata`
WHERE start_station_name IS NOT NULL
  AND start_station_id IS NOT NULL
  AND end_station_name IS NOT NULL
  AND end_station_id IS NOT NULL
  AND end_lat IS NOT NULL
  AND end_lng IS NOT NULL;
```
# Analyze and Share Data
17. Download the results from Step 16 as a csv file and upload onto Tableau for analysis. Our main goal here is to understand distinct usage patterns
and how members use the stations compared to casual riders.

18. Here we are trying to compare the specific types of bikes and how often these bikes are used by both members and casual riders. I used a pie chart to give me a percentage of the
population that use both bikes and who is what. The results showed that members tend to use their bikes more often than casual riders. Among the electric bike users however, we
see that there is a slight difference between who uses their bikes more often. Overall though, we see a large difference between the members and casual riders. Below is the finalized chart:

![Total Bike Types](Data%20Visuals/Total%20Bike%20Types.png)

19. To further discover how annual members and casual riders use their bikes differently, let’s explore the amount of trips they take monthly, daily, and by the hour. Using line graphs, I
would drag the ride_id, member_casual, and started_at fields into their respective rows
and columns and use the dropdown pills at the started_at field to adjust it based on hour,
week, and month. Below is the finalized graph:

![Total Trips](Data%20Visuals/Total%20Trips%202025-26.png)

After interpreting the data and visuals, we see that overall members go on way more trips than
casual riders. We also see that riders tend to ride the most from April-May when the temperature
would be warm, but not excruciatingly hot. We also see that per hour, members have a peak
from 6-8AM and 4-6PM. This could indicate that they use it the most when they have to
commute to a workplace or college and then come back home. Among casual users however,
the trend is more steady hourly with it increasing in the evening which most likely indicates that
they go whenever they please and mainly go for leisure. However to get a better grasp of the
trends, we should take a closer look at average time they ride.

20.  To find the average riding duration, I had to make a new field called ride_length_mins. I
had to use this calculation: DATEDIFF('minute', [Started At], [Ended At]) and change the
applied cell from SUM to AVG. Once I did that, I put the member_casual and started_at fields in their appropriate row and column. Below is the finalized graph:

![Average Trip Duration](Data%20Visuals/Average%20Trip%20Duration%202025-26.png)

21. After we use the start latitude and longitude values to make a map showing the most common hotspots of both casual riders and members. From here, it looks like casual riders start their trips around beaches, museums, parks,
aquariums, and harbors. Members, however, start their trips near universities, residential areas, restaurants, hospitals, grocery stores, theaters, schools, banks, factories, train
stations, parks, and plazas. We can see this on the map below:

![Starting Locations](Data%20Visuals/Total%20Trips%20at%20Starting%20Locations%202025-26.png)

22. Using the ending longitudinal and latitudinal cells to make another map, we see a similar pattern with the ending trips. Casual riders tend to end their journeys
near recreational sites like museums, parks, and aquariums. Members tend to end their
journeys near universities, residential, and commercial areas. This further proves that
casual riders use their bikes for leisure and recreational uses whereas members use
them for professional and daily activities.

![Ending Locations](Data%20Visuals/Total%20Trips%20at%20Ending%20Locations%202025-26.png)

# Summary
For Casual Riders:

Casual riders prefer to mostly bike throughout the day and they tend to travel the most during
weekends and especially during the summer and spring months. They also mainly travel for
leisure and recreational activities. They cover way more distances (about twice as much)
compared to members but they take fewer overall trips.

Also, casual riders tend to start and end their journeys near different recreational sites such as
parks, aquariums, coastal areas, and other leisure locations.

For members:

Members tend to travel the most during weekdays, also during summer and spring seasons
however they tend to travel the most from 8am-5pm. They take more frequent trips however
they cover shorter distances.

Also, they tend to start and end their journeys near locations such as universities, residential
areas, and commercial locations, showing they rely on their bikes for daily activities such as
going to work or school.

# Act
In order to get casual riders to convert to members, I would recommend these things:

● Target casual riders during the spring and summer months for marketing campaigns.

● Put marketing at the recreational/tourist hotspots such as posters or billboards.

● Provide potential discounts for people who travel long distances, and provide free trials
in order to let them have a feel of the service.

● Provide seasonal/weekend-only memberships as well since that is when they are most
active.
