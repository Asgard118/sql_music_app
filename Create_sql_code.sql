-- Создание таблицы Genres (Жанры)
CREATE TABLE Genres (
  genre_id SERIAL PRIMARY KEY,
  genre_name VARCHAR(100) NOT NULL
);

-- Создание таблицы Artists (Исполнители)
CREATE TABLE Artists (
  artist_id SERIAL PRIMARY KEY,
  artist_name VARCHAR(200) NOT NULL
);

-- Создание таблицы Genres_Artists (Связь между жанрами и исполнителями)
CREATE TABLE Genres_Artists (
  genre_id INT REFERENCES Genres(genre_id) ON DELETE CASCADE,
  artist_id INT REFERENCES Artists(artist_id) ON DELETE CASCADE,
  PRIMARY KEY (genre_id, artist_id)
);

-- Создание таблицы Albums (Альбомы)
CREATE TABLE Albums (
  album_id SERIAL PRIMARY KEY,
  album_name VARCHAR(200) NOT NULL,
  release_year INT
);

-- Создание таблицы Artists_Albums (Связь между исполнителями и альбомами)
CREATE TABLE Artists_Albums (
  artist_id INT REFERENCES Artists(artist_id) ON DELETE CASCADE,
  album_id INT REFERENCES Albums(album_id) ON DELETE CASCADE,
  PRIMARY KEY (artist_id, album_id)
);

-- Создание таблицы Tracks (Треки)
CREATE TABLE Tracks (
  track_id SERIAL PRIMARY KEY,
  track_name VARCHAR(200) NOT NULL,
  duration INT NOT NULL, -- Длительность в секундах
  album_id INT REFERENCES Albums(album_id) ON DELETE CASCADE
);

-- Создание таблицы Compilations (Сборники)
CREATE TABLE Compilations (
  compilation_id SERIAL PRIMARY KEY,
  compilation_name VARCHAR(200) NOT NULL,
  release_year INT
);

-- Создание таблицы Compilations_Tracks (Связь между сборниками и треками)
CREATE TABLE Compilations_Tracks (
  compilation_id INT REFERENCES Compilations(compilation_id) ON DELETE CASCADE,
  track_id INT REFERENCES Tracks(track_id) ON DELETE CASCADE,
  PRIMARY KEY (compilation_id, track_id)
);