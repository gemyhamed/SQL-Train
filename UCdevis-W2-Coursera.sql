These Are my answers to the 'SQL for Data Science ,University of California, Davis' Course on Coursera 

#Week2

All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.
(https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png)

-----------

Q1 : Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.

Select
TrackId 
from Tracks
where Milliseconds >= 5000000

------

Q2 : Run Query: Find all the invoices whose total is between $5 and $15 dollars.

select
InvoiceId , Total
From Invoices 
Where Total between 5 AND 15

------

Q3 : Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

Select FirstName , LastName  , State , Company from Customers 
Where State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA','NY')

------

Q4 : Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

select InvoiceId , CustomerId , Total, InvoiceDate From Invoices 
Where CustomerId IN (56,58) AND Total between 1 and 5

------

Q5 : Run Query: Find all the tracks whose name starts with 'All'.

SELECT Name From Tracks Where Name like 'All%'

------

Q6 :Run Query: Find all the customer emails that start with "J" and are from gmail.com.

SELECT Email From Customers Where Email Like 'J%gmail.com'

------

Q7 :Run Query: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

Select Total , BillingCity , InvoiceId  From Invoices where BillingCity IN ('Brasília', 'Edmonton', 'Vancouver') 
Order By  InvoiceId Desc

------

Q8 : Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.

Select Count(InvoiceId)
From Invoices Group By CustomerId order by Count(InvoiceId) desc

------

Q9 : Run Query: Find the albums with 12 or more tracks.

SELECT Name,TrackId,AlbumId  From Tracks  Group By AlbumId 
Having Count(AlbumId) >=12

