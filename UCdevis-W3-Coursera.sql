All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.

(https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png)

-----------------------------------------------------------------------

Q1 : Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name From Tracks Where albumid IN (
SELECT albumid from albums where albums.title = 'Californication')

----
Q2 : Find the total number of invoices for each customer along with the customer's full name, city and email.

SELECT count(invoiceid)  , c.FirstName , c.LastName , c.city,
c.email from invoices i Inner Join Customers c 
ON  i.customerid = c.customerid 
group by c.customerid

----
Q3 :Retrieve the track name, album, artistID, and trackID for all the albums.

Select a.title ,a.artistid,t.name,t.trackid From
Albums a left Join Tracks t 
ON a.albumid = t.albumid 

----
Q4 : Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT employeeid , firstname ,lastname , reportsto from employees

----
Q5 : Find the name and ID of the artists who do not have albums.

SELECT art.name , art.artistid ,alb.albumid ,alb.title
from artists art left join albums alb
ON art.artistid = alb.artistid 
where alb.title IS Null

----
Q6 : Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT employees.firstname as First_name ,employees.lastname as last_name
FROM employees Union 
SELECT customers.firstname , customers.lastname 
From customers
order by (last_name) DESC

----
Q7 : See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT c.city , i.billingcity , c.customerid from customers  c 
inner join invoices i 
on c.customerid = i.customerid
where c.city <> i.billingcity

