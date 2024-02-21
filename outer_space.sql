-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space_db;

CREATE DATABASE outer_space_db;

\c outer_space_db

--CREATE TABLE planets
--(
--  id SERIAL PRIMARY KEY,
--  name TEXT NOT NULL,
--  orbital_period_in_years FLOAT NOT NULL,
--  orbits_around TEXT NOT NULL,
--  galaxy TEXT NOT NULL,
--  moons TEXT[]
--);

CREATE TABLE galaxy(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planet_details(
  id SERIAL PRIMARY KEY,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  moons TEXT[]
);

--CREATE TABLE moons(
--  id SERIAL PRIMARY KEY,
--  name TEXT NOT NULL,
--  planets_id INTEGER REFERENCES planets(id)
--);

CREATE TABLE full_planet_details(
  id SERIAL PRIMARY KEY,
  planets_id INTEGER REFERENCES planets(id),
  galaxy_id INTEGER REFERENCES galaxy(id),
  planet_details_id INTEGER REFERENCES planet_details(id)
);

INSERT INTO planets
  (name)
  VALUES
  ('Earth'),
  ('Mars'),
  ('Venus'),
  ('Neptune'),
  ('Proxima Centauri b'),
  ('Gliese 876 b');

INSERT INTO galaxy
(name)
VALUES
('Milky Way');

INSERT INTO planet_details
(orbital_period_in_years,orbits_around,moons)
VALUES
( 1.00, 'The Sun','{"The Moon"}'),
( 1.88, 'The Sun', '{"Phobos", "Deimos"}'),
( 0.62, 'The Sun', '{}'),
(164.8, 'The Sun',  '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
( 0.03, 'Proxima Centauri',  '{}'),
( 0.23, 'Gliese 876',  '{}');

INSERT INTO full_planet_details
(planets_id,galaxy_id,planet_details_id)
VALUES
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,4),
(5,1,5),
(6,1,6);

SELECT full_planet_details.id,planets.name,planet_details.orbital_period_in_years,planet_details.orbits_around,planet_details.moons,galaxy.name
FROM full_planet_details
JOIN planets ON full_planet_details.planets_id = planets.id
JOIN planet_details ON full_planet_details.planet_details_id = planet_details.id
JOIN galaxy ON full_planet_details.galaxy_id = galaxy.id;


--INSERT INTO planets
--  (name, orbital_period_in_years, orbits_around, galaxy, moons)
--VALUES
--  ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--  ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--  ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--  ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');