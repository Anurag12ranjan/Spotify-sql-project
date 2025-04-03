-- Advanced sql project -- Softify Datasets

create table spotify(
    artist varchar(255),
	track varchar(255),
	album varchar(255),
	album_type varchar(50),
	danceability float,
	energy float,
	loudness float,
	speechiness float,
	acousticness float,
	instrumentalness float,
	liveness float,
	valence float,
	tempo float,
	duration_min float,
	title varchar(255),
	channel varchar(255),
	views float,
	likes float,
	comments float,
	licensed boolean,
	official_video boolean,
	stream float,
	energy_liveness float,
	most_played_on varchar(50)
);

select * from spotify;

-- EDA
select count(*)
from spotify;

select count(distinct artist)
from spotify;

select count(distinct album)
from spotify;

select distinct album_type
from spotify;

select max(duration_min)
from spotify;

select min(duration_min)
from spotify;

select * from spotify 
where duration_min = 0

delete from spotify
where duration_min =0;

select distinct channel
from spotify;

select distinct most_played_on
from spotify;

-- ---------------------------------
-- Data Analysis -easy category
-- ---------------------------------

-- 1. Retrive the names of all  tracks that have more than 1 billion stream
select * from spotify
where stream > 1000000000;

--2. list all album along with thier respective artists
select  distinct album,artist
from spotify;

--3. get the total number of comments for tracks where licensed = True
select sum(comments) as total_comments
from spotify
where licensed = 'true';

--4. find all tacks that belongs to the album type single
select *
from spotify
where album_type = 'single';

--5 count the total number of tracks by each artist
select artist, count(*) as total_no_of_songs
from spotify
group by artist;

-- --------------------------------
-- Medium level
-- --------------------------------

-- 6. calculate the average danceability of tracks in each album
select album, avg(danceability) as avg_danceability
from spotify
group by album
order by 2 desc;

--7. find the top 5 tracks with the highest energy values
select track, max(energy) as max_energy
from spotify
group by track
order by 2 desc
limit 5;

--8. list all tracks along ewith their views and likes where official_video = true
select track,
      sum(views) as total_views,
	  sum(likes) as total_likes
from spotify
where official_video = 'true'
group by track
order by 2 desc;

--9. for each album, calculate the total views of all associate track
select album,
       track,
       sum(views) as total_views
from spotify
group by album,track
order by 3 desc;


--10. retive the track names that have been streamed on spotify more than youtube
select  * from
(select track,
        coalesce(sum(case when most_played_on = 'Youtube' then stream end),0) as streamed_on_youtube,
		coalesce(sum(case when most_played_on = 'Spotify' then stream end),0) as streamed_on_spotify		
from spotify
group by 1
) as t1
where streamed_on_spotify > streamed_on_youtube
and
streamed_on_youtube <> 0;

-- -----------------------------
-- Advanced Problems
-- -----------------------------

--11. Find the top 3 most-viewed tracks for each artists using window functions
with ranking_artist
as
(select artist,
       track,
	   sum(views) as total_views,
	   dense_rank() over(partition by artist order by sum(views) desc) as rank
from spotify
group by 1,2
order by 1,3 desc
)
select * from ranking_artist
where rank <= 3;

--12. write a query to find tracks where the liveness score is above the average
select track,
       artist,
	   liveness
from spotify
where liveness > (select avg(liveness) from spotify);

--13. use a with clause to calculate the difference between the highest and lowest energy values 
-- for tracks in each album
with cte
as
(select 
      album,
	  max(energy) as highest_energy,
	  min(energy) as lowest_energy
from spotify
group by 1
)
select album,
highest_energy - lowest_energy as energy_diff
from cte
order by 2 desc;

-- 14. Find tracks where the energy to liveness ratio is greater than 1.2
select 
    track,
	artist,
	energy,
	liveness,
	(energy/liveness) as energy_liveness_ratio
from spotify
where (energy/liveness) > 1.2;

--15. Calculate the cumilative sum of likes for tracks ordered by the number of views using 
-- window functions
select 
     track,
	 likes,
	 views,
	 sum(likes) over(order by views desc) as cumilative_likes
from spotify;
