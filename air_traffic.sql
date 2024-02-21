-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

--CREATE TABLE tickets
--(
--  id SERIAL PRIMARY KEY,
--  first_name TEXT NOT NULL,
--  last_name TEXT NOT NULL,
--  seat TEXT NOT NULL,
--  departure TIMESTAMP NOT NULL,
--  arrival TIMESTAMP NOT NULL,
--  airline TEXT NOT NULL,
--  from_city TEXT NOT NULL,
--  from_country TEXT NOT NULL,
--  to_city TEXT NOT NULL,
--  to_country TEXT NOT NULL
--);

CREATE TABLE flight_passenger(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE flights_airline(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE flight_location(
  id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE further_flight_details(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE full_ticket(
  id SERIAL PRIMARY KEY,
  flight_passenger_id INTEGER REFERENCES flight_passenger(id),
  flights_airline_id INTEGER REFERENCES flights_airline(id),
  flight_location_id INTEGER REFERENCES flight_location(id),
  further_flight_details_id INTEGER REFERENCES further_flight_details(id)
);
--could add another jennifer here to avoid the mix mathing of ID in insert for full_ticket
INSERT INTO flight_passenger(first_name,last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

INSERT INTO flights_airline(airline)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('United'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO flight_location(from_city,from_country,to_city ,to_country)
VALUES 
('Washington DC', 'United States', 'Seattle', 'United States'),
( 'Tokyo', 'Japan', 'London', 'United Kingdom'),
('Los Angeles', 'United States', 'Las Vegas', 'United States'),
('Seattle', 'United States', 'Mexico City', 'Mexico'),
( 'Paris', 'France', 'Casablanca', 'Morocco'),
('Dubai', 'UAE', 'Beijing', 'China'),
('New York', 'United States', 'Charlotte', 'United States'),
('Cedar Rapids', 'United States', 'Chicago', 'United States'),
('Charlotte', 'United States', 'New Orleans', 'United States'),
( 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

INSERT INTO further_flight_details(seat,departure,arrival)
VALUES
( '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
( '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00');

INSERT INTO full_ticket(flight_passenger_id,flights_airline_id,flight_location_id,further_flight_details_id)
VALUES
(1,1,1,1),
(2,2,2,2),
(3,3,3,3),
(1,3,4,4),
(5,4,5,5),
(2,5,6,6),
(7,1,7,7),
(8,7,8,8),
(7,7,9,9),
(10,8,10,10);

SELECT flight_passenger.first_name,flight_passenger.last_name,
flights_airline.airline,
flight_location.from_city,flight_location.from_country,
flight_location.to_city,flight_location.to_country,
further_flight_details.seat,further_flight_details.departure,
further_flight_details.arrival
FROM full_ticket JOIN flight_passenger ON full_ticket.flight_passenger_id = flight_passenger.id
JOIN flights_airline ON full_ticket.flights_airline_id = flights_airline.id
JOIN flight_location  ON full_ticket.flight_location_id = flight_location.id
JOIN further_flight_details ON full_ticket.further_flight_details_id = further_flight_details.id;


--INSERT INTO tickets
--  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
--VALUES
--  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');