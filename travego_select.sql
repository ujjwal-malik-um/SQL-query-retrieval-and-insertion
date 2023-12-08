/*
a. How many females and how many male passengers travelled for a minimum distance of 600 KM s?
*/
select Gender, count(Gender) FROM Passenger where Distance>=600 group by Gender ;
 

/*
b. Find the minimum ticket price for Sleeper Bus. 
*/

select min(Price) from Price where Bus_Type = 'Sleeper';

/*
c. Select passenger names whose names start with character 'S' 

*/

select Passenger_Name FROM Passenger where Passenger_Name like 'S%' order by Passenger_Name;

/*
d. Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
*/

select a.Passenger_name,a.Boarding_City,a.Destination_City,a.Bus_type,b.Price from Passenger a , Price b where (a.Bus_Type = b.Bus_Type and a.Distance = b.Distance);

/*
e. What are the passenger name/s and his/her ticket price who travelled in the Sitting bus for a distance of 700 KM s 

*/

select a.Passenger_name,b.Price from Passenger a ,Price b where (a.Bus_Type = "Sitting" and b.Bus_Type = "Sitting" and a.Distance = 700 and b.Distance=700);

/*
f. Pallavi has traveled from Panaji to Bengaluru. What will be the Sitting and Sleeper bus charge for Pallavi if she wants to travel back from Bengaluru to Panaji?
*/

SELECT Price FROM Price where distance=(SELECT Distance FROM Passenger where passenger_name = "Pallavi");

/*
g. List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. 
*/

SELECT distinct(Distance) FROM Passenger order by distance desc;

/*
h. Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables 
*/

with total as ( select sum(distance) as total from Passenger) select passenger_Name,(distance / total.total)*100 as percentage_travel from Passenger,total ;