-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

--CREATE TABLE songs(
--  id SERIAL PRIMARY KEY,
--  title TEXT NOT NULL,
--  artist TEXT[]NOT NULL,
--  album TEXT NOT NULL
--);
--
--CREATE TABLE song_info(
--  id SERIAL PRIMARY KEY,
--  song_id INTEGER REFERENCES songs(id)
--  release_date DATE NOT NULL,
--  duration_in_seconds INTEGER NOT NULL,
--  album TEXT NOT NULL,
--  producers TEXT[] NOT NULL
--);






CREATE TABLE songs(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  artist TEXT[]NOT NULL

);

CREATE TABLE song_info(
  id SERIAL PRIMARY KEY,
  release_date DATE NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album TEXT NOT NULL,
  producers TEXT[] NOT NULL
);

CREATE TABLE full_song_info(
  id SERIAL PRIMARY KEY,
  song_id  INTEGER REFERENCES songs(id),
  song_info_id INTEGER REFERENCES song_info(id)
);


INSERT INTO songs(title,artist)
VALUES
('MMMBop','{"Hanson"}'),
('Bohemian Rhapsody', '{"Queen"}'),
('One Sweet Day', '{"Mariah Cary", "Boyz II Men"}'),
('Shallow', '{"Lady Gaga", "Bradley Cooper"}'),
('How You Remind Me',  '{"Nickelback"}'),
('New York State of Mind','{"Jay Z", "Alicia Keys"}'),
('Dark Horse',  '{"Katy Perry", "Juicy J"}'),
('Moves Like Jagger', '{"Maroon 5", "Christina Aguilera"}'),
('Complicated',  '{"Avril Lavigne"}'),
('Say My Name', '{"Destiny''s Child"}');

INSERT INTO song_info(duration_in_seconds,release_date,album,producers)
VALUES 

(238, '04-15-1997', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
( 355, '10-31-1975',  'A Night at the Opera', '{"Roy Thomas Baker"}'),
(282, '11-14-1995', 'Daydream', '{"Walter Afanasieff"}'),
( 216, '09-27-2018', 'A Star Is Born', '{"Benjamin Rice"}'),
(223, '08-21-2001', 'Silver Side Up', '{"Rick Parashar"}'),
( 276, '10-20-2009','The Blueprint 3', '{"Al Shux"}'),
( 215, '12-17-2013','Prism', '{"Max Martin", "Cirkut"}'),
(201, '06-21-2011', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
( 244, '05-14-2002', 'Let Go', '{"The Matrix"}'),
(240, '11-07-1999',  'The Writing''s on the Wall', '{"Darkchild"}');


INSERT INTO full_song_info(song_id,song_info_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

SELECT songs.title,songs.artist,
song_info.duration_in_seconds,
song_info.release_date,
song_info.album,
song_info.producers
FROM songs JOIN full_song_info ON songs.id = full_song_info.song_id
JOIN song_info ON full_song_info.song_info_id = song_info.id;


--CREATE TABLE songs
--(
--  id SERIAL PRIMARY KEY,
--  title TEXT NOT NULL,
--  duration_in_seconds INTEGER NOT NULL,
--  release_date DATE NOT NULL,
--  artists TEXT[] NOT NULL,
--  album TEXT NOT NULL,
--  producers TEXT[] NOT NULL
--);

--INSERT INTO songs
--  (title, duration_in_seconds, release_date, artists, album, producers)
--VALUES
--  ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--  ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--  ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--  ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--  ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--  ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--  ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--  ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--  ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--  ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
