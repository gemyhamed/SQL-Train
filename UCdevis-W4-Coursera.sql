These Are my answers to the 'SQL for Data Science ,University of California, Davis' Course on Coursera 
Course Link : https://www.coursera.org/learn/sql-for-data-science/home/welcome

#Week4


All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.

(https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png)

--------------------------------------------------------------------------

Q1 : Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE.What is the city and country result for CustomerID 16?

SELECT c.customerid , c.firstname , c.lastname , c.address , 
upper(c.city) || ' ' || upper( c.country) as  'City/Country' from customers c

------
Q2 : Create a new employee user id by combining the first 4 letter of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.What is the final result for Robert King?

select e.employeeid , e.firstname , e.lastname , 
substr( lower (e.Firstname) , 1 , 4 ) || substr(lower (e.lastname) , 1 ,2  ) as 
New_id 
from employees e

------
Q3 : Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.What is the lastname of the last person on the list returned?

SELECT  lastname , date(hiredate) ,
date('now') - date(hiredate) as time_since_hiring 
from employees where time_since_hiring >=15 
order by lastname asc

------
Q4 : Profiling the Customers table, answer the following question.Are there any columns with null values? Indicate any below. Select all that apply.

select *
from Customers c
where c.Company is null 

-----
Q5 : Find the cities with the most customers and rank in descending order.

select city , count(city)  from customers group by city 
order by count(city) desc
-----
Q6 : Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.Select all of the correct "AstridGruber" entries that are returned in your results below. Select all that apply.



Select c.firstname , c.lastname , i.invoiceid , 
c.firstname || c.lastname || i.invoiceid  as new_id
from customers c inner join 
invoices  i on  c.customerid = i.customerid 
where c.firstname = 'Astrid'






