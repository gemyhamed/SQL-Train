These Are my answers to the 'SQL for Data Science ,University of California, Davis' Course on Coursera  last Assignment
Course Link : https://www.coursera.org/learn/sql-for-data-science/home/welcome

#Week4

(https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/hOlYbrgyEeeTsRKxhJ5OZg_517578844a2fd129650492eda3186cd1_YelpERDiagram.png?expiry=1554422400000&hmac=Hgir2mepfLlEN5sK_g4lOjyfi96BcDUoLqI04YqoYAw)
Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table =  10000
vii. hours table = 10000
viii. photo table =  10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business =10000
ii. Hours =1562
iii. Category =2643 
iv. Attribute = 1115
v. Review =10000
vi. Checkin = 493 
vii. Photo =10000 
viii. Tip = 537 
ix. User = 10000 
x. Friend = 11
xi. Elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: NO
	
	
	SQL code used to arrive at answer:
	
	SELECT count(*) from users where id IS NULL OR name IS NULL OR review_count IS NULL OR  yelping_since IS NULL OR useful IS NULL OR funny IS NULL OR 
cool IS NULL OR fans IS NULL OR average_stars IS NULL OR compliment_hot IS NULL OR compliment_more IS NULL OR compliment_profile IS NULL OR compliment_cute IS NULL OR compliment_list IS NULL OR compliment_note IS NULL OR compliment_plain IS NULL OR compliment_cool IS NULL OR compliment_funny IS NULL OR compliment_writer IS NULL OR compliment_photos IS NULL 

	
	
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:	1	max:	5	avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min:	1	max:	5	avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min:	0	max:	2	avg: 0.0144

		
	
	iv. Table: Checkin, Column: Count
	
		min:	1	max:	53	avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min:	0	max:	2000	avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	select city , sum(review_count) from business group by (city) order by sum(review_count) desc
	
	Copy and Paste the Result Below:
	+-----------------+-------------------+
| city            | sum(review_count) |
+-----------------+-------------------+
| Las Vegas       |             82854 |
| Phoenix         |             34503 |
| Toronto         |             24113 |
| Scottsdale      |             20614 |
| Charlotte       |             12523 |
| Henderson       |             10871 |
| Tempe           |             10504 |
| Pittsburgh      |              9798 |
| Montréal        |              9448 |
| Chandler        |              8112 |
| Mesa            |              6875 |
| Gilbert         |              6380 |
| Cleveland       |              5593 |
| Madison         |              5265 |
| Glendale        |              4406 |
| Mississauga     |              3814 |
| Edinburgh       |              2792 |
| Peoria          |              2624 |
| North Las Vegas |              2438 |
| Markham         |              2352 |
| Champaign       |              2029 |
| Stuttgart       |              1849 |
| Surprise        |              1520 |
| Lakewood        |              1465 |
| Goodyear        |              1155 |
+-----------------+-------------------+

	

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer: select  stars , sum(review_count) from business where city = 'Avon'  group by stars


Copy and Paste the Resulting Table Below (2 columns – star rating and count):
+-------+-------------------+
| stars | sum(review_count) |
+-------+-------------------+
|   1.5 |                10 |
|   2.5 |                 6 |
|   3.5 |                88 |
|   4.0 |                21 |
|   4.5 |                31 |
|   5.0 |                 3 |
+-------+-------------------+


ii. Beachwood

SQL code used to arrive at answer: select  stars , sum(review_count) from business where city = 'Beachwood'  group by stars


Copy and Paste the Resulting Table Below (2 columns – star rating and count):
+-------+-------------------+
| stars | sum(review_count) |
+-------+-------------------+
|   2.0 |                 8 |
|   2.5 |                 3 |
|   3.0 |                11 |
|   3.5 |                 6 |
|   4.0 |                69 |
|   4.5 |                17 |
|   5.0 |                23 |
+-------+-------------------+

		


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:select name , sum(review_count) from user group by name order by sum(review_count) desc
	
		
	Copy and Paste the Result Below:
+--------+-------------------+
| name   | sum(review_count) |
+--------+-------------------+
| Nicole |              2397 |
| Sara   |              2253 |
| Gerald |              2034 |
+--------+-------------------+



8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results: No , i don't think there's a strong correlation between fans and revies as by displaying the reviews next to fans column you will find that there's no strong correlation 
	code : 
	select name , review_count , fans from user  order by fans desc 
	

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: 
	Love :yes , 1780  times
	Hate : yes , 232  times

	
	SQL code used to arrive at answer:
    select count(text) from review where text like '%love%'
	select count(text) from review where text like '%hate%'
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	select name , fans from user order by fans desc limit 10

	
	Copy and Paste the Result Below:

	+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+

	
11. Is there a strong relationship (or correlation) between having a high number of fans and being listed as "useful" or "funny?" Out of the top 10 users with the highest number of fans, what percent are also listed as “useful” or “funny”?

Key:
0% - 25% - Low relationship
26% - 75% - Medium relationship
76% - 100% - Strong relationship
	
	SQL code used to arrive at answer:
	
		select name , fans , funny,useful ,review_count from user order by fans desc limit 10

	Copy and Paste the Result Below:
	+-----------+------+--------+--------+--------------+
| name      | fans |  funny | useful | review_count |
+-----------+------+--------+--------+--------------+
| Amy       |  503 |   2554 |   3226 |          609 |
| Mimi      |  497 |    138 |    257 |          968 |
| Harald    |  311 | 122419 | 122921 |         1153 |
| Gerald    |  253 |   2324 |  17524 |         2000 |
| Christine |  173 |   6646 |   4834 |          930 |
| Lisa      |  159 |     13 |     48 |          813 |
| Cat       |  133 |    672 |   1062 |          377 |
| William   |  126 |   9361 |   9363 |         1215 |
| Fran      |  124 |   7606 |   9851 |          862 |
| Lissa     |  120 |    150 |    455 |          834 |
+-----------+------+--------+--------+--------------+

	
	Please explain your findings and interpretation of the results:
	yes there's a correlation 
	
	

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

yes 
group no.1 :Saturday|5:00-20:00  
group no.2 : Saturday|11:00-22:00

ii. Do the two groups you chose to analyze have a different number of reviews?
yes 
group no.1 :  52 
group no.2 : 431


iii. Are you able to infer anything from the location data provided between these two groups? Explain.

No , they are very close 

SQL code used for analysis:

SELECT b.name , b.stars , c.category ,  h.hours ,b.review_count , b.longitude , b.latitude
FROM business  b inner join category c  on b.id = c.business_id
inner join hours h on h.business_id = b.id
WHERE CITY = 'Phoenix' and c.category = 'Food' group by(name) order by b.stars asc





2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:

The Closd ones have relatively less review_counts 

ii. Difference 2:
Toronto  , las vegas , Cleveland   are the best cities to keep a business open as  they marginally differ from the rest of the cities 


SQL code used for analysis:

select b.name , b.is_open ,b.stars , b.review_count , b.city , count(b.city) from business b  
inner join category c on b.id = c.business_id

group by (name) order by ( count(b.city)) desc
	
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
   comparing the no of open vs no of closed businesses in the top 3 citites in the last analysis  :Toronto  , las vegas and Cleveland
   
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

no of closed businesses is much less than open ones , so these 3 cities are greatn for new business

iii. Output of your finished dataset:
+-----------+----------------------+
| city      | count(b.is_open = 1) |
+-----------+----------------------+
| Cleveland |                  159 |
| Las Vegas |                 1311 |
| Toronto   |                  788 |
+-----------+----------------------+
+-----------+----------------------+
| city      | count(b.is_open = 0) |
+-----------+----------------------+
| Cleveland |                   30 |
| Las Vegas |                  250 |
| Toronto   |                  197 |
+-----------+----------------------+

  
iv. Provide the SQL code you used to create your final dataset:

select   b.city ,count(b.is_open = 1) from business b  
where b.city in ('Las Vegas','Cleveland','Toronto') And is_open = 1

group by (city) 
--
select   b.city ,count(b.is_open = 0) from business b  
where b.city in ('Las Vegas','Cleveland','Toronto') And is_open = 0

group by (city) 

