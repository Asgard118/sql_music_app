-- Заполнение таблицы Genres (Жанры)
INSERT INTO Genres (genre_name) VALUES
  ('Rock'),
  ('Pop'),
  ('Hip-Hop'),
  ('Electronic');

-- Заполнение таблицы Artists (Исполнители)
INSERT INTO Artists (artist_name) VALUES
  ('Beatles'),
  ('Taylor Swift'),
  ('Kendrick Lamar'),
  ('Daft Punk');

-- Заполнение таблицы Genres_Artists (Связь между жанрами и исполнителями)
INSERT INTO Genres_Artists (genre_id, artist_id) VALUES
  (1, 1), -- The Beatles (Rock)
  (2, 2), -- Taylor Swift (Pop)
  (3, 3), -- Kendrick Lamar (Hip-Hop)
  (4, 4); -- Daft Punk (Electronic)

-- Заполнение таблицы Albums (Альбомы)
INSERT INTO Albums (album_name, release_year) VALUES
  ('Abbey Road', 1969),
  ('1989', 2014),
  ('good kid, m.A.A.d city', 2012),
  ('Random Access Memories', 2013);

-- Заполнение таблицы Artists_Albums (Связь между исполнителями и альбомами)
INSERT INTO Artists_Albums (artist_id, album_id) VALUES
  (1, 1), -- The Beatles - Abbey Road
  (2, 2), -- Taylor Swift - 1989
  (3, 3), -- Kendrick Lamar - good kid, m.A.A.d city
  (4, 4); -- Daft Punk - Random Access Memories

-- Заполнение таблицы Tracks (Треки)
INSERT INTO Tracks (track_name, duration, album_id) VALUES
  ('Come Together', 259, 1),
  ('Shake It Off', 219, 2),
  ('Bitch, Don’t Kill My Vibe', 300, 3),
  ('Get Lucky', 369, 4),
  ('Let It Be', 243, 1),
  ('Blank Space', 231, 2);

-- Заполнение таблицы Compilations (Сборники)
INSERT INTO Compilations (compilation_name, release_year) VALUES
  ('Summer Hits 2020', 2020),
  ('Rap Anthems', 2019),
  ('Electronic Vibes', 2021),
  ('Best of Pop', 2018);

-- Заполнение таблицы Compilations_Tracks (Связь между сборниками и треками)
INSERT INTO Compilations_Tracks (compilation_id, track_id) VALUES
  (1, 2), -- Summer Hits 2020 - Shake It Off
  (2, 3), -- Rap Anthems - Bitch, Don’t Kill My Vibe
  (3, 4), -- Electronic Vibes - Get Lucky
  (4, 6); -- Best of Pop - Blank Space

