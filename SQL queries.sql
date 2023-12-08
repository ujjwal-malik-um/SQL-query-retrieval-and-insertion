--1.a.
CREATE SCHEMA Travego;

--1.b.
USE Travego;

CREATE TABLE Passenger (
  Passenger_id INT NOT NULL AUTO_INCREMENT,
  Passenger_name VARCHAR(255) NOT NULL,
  Category VARCHAR(255) NOT NULL,
  Gender VARCHAR(255) NOT NULL,
  Boarding_City VARCHAR(255) NOT NULL,
  Destination_City VARCHAR(255) NOT NULL,
  Distance INT NOT NULL,
  Bus_Type VARCHAR(255) NOT NULL,
  PRIMARY KEY (Passenger_id)
);

CREATE TABLE Price (
  id INT NOT NULL AUTO_INCREMENT,
  Bus_Type VARCHAR(255) NOT NULL,
  Distance INT NOT NULL,
  Price INT NOT NULL,
  PRIMARY KEY (id)
);

--1.c.
USE Travego;

INSERT INTO Passenger (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type)
VALUES
('Sejal', 'AC', 'LL F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
('Pallavi', 'AC', 'F LL', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
('Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
('Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
('Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

INSERT INTO Price (Bus_type, Distance, Price)
VALUES
('Sleeper', 350, 770),
('Sleeper', 500, 1100),
('Sleeper', 600, 1320),
('Sleeper', 700, 1540),
('Sleeper', 1000, 2200),
('Sleeper', 1200, 2640),
('Sleeper', 1500, 2700),
('Sitting', 500, 620),
('Sitting', 600, 744),
('Sitting', 700, 868),
('Sitting', 1000, 1240),
('Sitting', 1200, 1488),
('Sitting', 1500, 1860);

--2.a.
SELECT Gender, COUNT(*) AS Total_Passengers
FROM Passenger
WHERE Distance >= 600
GROUP BY Gender;

--2.b.
SELECT MIN(Price) AS Minimum_Price
FROM Price
WHERE Bus_Type = 'Sleeper';

--2.c.
SELECT Passenger_name
FROM Passenger
WHERE Passenger_name LIKE 'S%';

--2.d.
SELECT Passenger_name, Boarding_City, Destination_City, Bus_Type,
(SELECT Price FROM Price WHERE Bus_Type = Passenger.Bus_Type AND Distance = Passenger.Distance) AS Price
FROM Passenger;

--2.e.
SELECT Passenger_name, Price
FROM Passenger
WHERE Distance = 1000 AND Bus_Type = 'Sitting';

--2.f.
SELECT
  Price AS Sitting_Price,
  (SELECT Price
   FROM Price
   WHERE Bus_Type = 'Sleeper' AND Distance = 600) AS Sleeper_Price
FROM Price
WHERE Bus_Type = 'Sitting' AND Distance = 600;

--2.g.
SELECT DISTINCT Distance
FROM Passenger
ORDER BY Distance DESC;

--2.h.
SELECT Passenger_name,
(Distance / SUM(Distance) OVER (PARTITION BY Gender)) * 100 AS Percentage
FROM Passenger
GROUP BY Gender;