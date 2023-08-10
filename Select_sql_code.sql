--SELCET апросы:

--Название и продолжительность самого длительного трека.
SELECT track_name, duration
FROM Tracks
ORDER BY duration DESC
LIMIT 1;

--Название и продолжительность самого длительного трека.
SELECT track_name
FROM Tracks
WHERE duration >= 210;
--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT compilation_name
FROM Compilations
WHERE release_year BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.
SELECT artist_name
FROM Artists
WHERE artist_name NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my».
SELECT track_name
FROM Tracks
WHERE track_name ILIKE '%мой%' OR track_name ILIKE '%my%';

--Количество исполнителей в каждом жанре.
SELECT g.genre_name, COUNT(ga.artist_id) AS artist_count
FROM Genres g
LEFT JOIN Genres_Artists ga ON g.genre_id = ga.genre_id
GROUP BY g.genre_name;
--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.track_id) AS track_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;
--Средняя продолжительность треков по каждому альбому.
SELECT a.album_name, AVG(t.duration) AS average_duration
FROM Albums a
JOIN Tracks t ON a.album_id = t.album_id
GROUP BY a.album_name;
--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT ar.artist_name
FROM Artists ar
LEFT JOIN Artists_Albums aa ON ar.artist_id = aa.artist_id
LEFT JOIN Albums a ON aa.album_id = a.album_id
WHERE a.release_year <> 2020 OR a.release_year IS NULL;
--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c.compilation_name
FROM compilations c
JOIN compilations_tracks ct ON c.compilation_id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN artists_albums aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.artist_name = 'Taylor Swift';



--ДОП
--Наименования треков, которые не входят в сборники.
SELECT t.track_name
FROM Tracks t
LEFT JOIN Compilations_Tracks ct ON t.track_id = ct.track_id
WHERE ct.track_id IS NULL;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT ar.artist_name, t.track_name, t.duration
FROM Tracks t
JOIN Albums a ON t.album_id = a.album_id
JOIN Artists_Albums aa ON a.album_id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.artist_id
WHERE t.duration = (
    SELECT MIN(duration)
    FROM Tracks
);

--Названия альбомов, содержащих наименьшее количество треков.
SELECT a.album_name, COUNT(t.track_id) AS track_count
FROM Albums a
LEFT JOIN Tracks t ON a.album_id = t.album_id
GROUP BY a.album_name
ORDER BY track_count ASC
LIMIT 1;