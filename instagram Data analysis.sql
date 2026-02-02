SELECT * FROM insta_analysis;
use insta_social_media;

-- 1)calculate total records
SELECT COUNT(*) FROM insta_analysis;

-- 2)calculate country-wise average exercise
SELECT country,AVG(exercise_hours_per_week) AS exercise_hours_per_week
FROM insta_analysis
GROUP BY country
ORDER BY exercise_hours_per_week DESC;

-- 3)Country-wise average Stress Score
select country,avg(perceived_stress_score) as avg_stress_score
from insta_analysis
group by country
order by avg_stress_score desc;

-- 4)Country-wise total Stress Score
select country,count(perceived_stress_score) as count_stress_score
from insta_analysis
group by country
order by count_stress_score desc;

-- 5)Premium vs Non-Premium Users
select uses_premium_features ,count(*) as uses_premium_features
from insta_analysis
group by uses_premium_features;

-- 6) Age group segmentation
SELECT
CASE
    WHEN age < 18 THEN 'Teen'
    WHEN age BETWEEN 18 AND 25 THEN 'Youth'
    WHEN age BETWEEN 26 AND 35 THEN 'Adult'
    ELSE 'Mature'
END AS age_group,
COUNT(*) AS total_users,
AVG(perceived_stress_score) AS avg_stress,
AVG(sleep_hours_per_night) AS sleep_avg
FROM insta_analysis
GROUP BY age_group
ORDER BY total_users DESC;

-- 7)show Followers vs likes vs comments activity
select followers_count,likes_given_per_day,comments_written_per_day
from insta_analysis
order by followers_count desc;

select * from insta_analysis;
-- 8)Stress vs Exercise
select avg(perceived_stress_score) as avg_stress,exercise_hours_per_week 
from insta_analysis
group by exercise_hours_per_week
order by avg_stress asc;
