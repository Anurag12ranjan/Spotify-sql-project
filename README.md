# Spotify-sql-project
Spotify SQL Project

Project Overview
This project analyzes a Spotify dataset using SQL. It involves data exploration, cleaning, and analysis of various musical attributes and engagement metrics.

Dataset Description
The dataset consists of the following attributes:
artist: Name of the artist
track: Song title
album: Album name
album_type: Type of album (e.g., album, single)
danceability: Measure of how suitable a track is for dancing
energy: Intensity and activity level of the song
loudness: Overall loudness in decibels
speechiness: Presence of spoken words in the track
acousticness: Likelihood of the track being acoustic
instrumentalness: Degree of instrumental focus in the song
liveness: Likelihood of the track being performed live
valence: Musical positivity of the track
tempo: Speed of the song in beats per minute
duration_min: Duration of the track in minutes
title: Title of the song
channel: Distribution channel
views: Number of views the track has received
likes: Number of likes
comments: Number of comments
licensed: Boolean indicating whether the track is licensed
official_video: Boolean indicating if an official video exists
stream: Number of times streamed
energy_liveness: Combination of energy and liveness scores
most_played_on: Platform where the track is most played

SQL Queries & Analysis
Data Exploration
Counting the total number of records
Counting distinct artists and albums
Identifying distinct album types
Finding maximum and minimum track duration
Identifying channels and platforms where tracks are most played
Data Cleaning
Removing records with zero duration
Handling missing or inconsistent values

How to Use
Import the dataset into a relational database management system (e.g., MySQL, PostgreSQL, SQLite).
Execute the SQL script to create the table and perform EDA.
Modify queries to gain additional insights based on your requirements.

Tools Used
SQL (Structured Query Language)
Database Management System (DBMS)

Conclusion
This project provides insights into the characteristics of popular Spotify tracks, their engagement metrics, and helps in data-driven decision-making for music analysis.

