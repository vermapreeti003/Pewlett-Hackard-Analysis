## OVERVIEW OF THE ANALYSIS
Pewlett-Hackard is an enormous company, employing tens of thousands of people. Many of which are starting to get to the age where they will be retiring, putting Pewlett-Hackard in a position where it needs to fill many positions. The purpose of this analysis is to determine how many employees are in a position to retire, and how many employees could be eligible to participate in a mentorship program to help mentor new hires.

We will be gathering the required data by querying a database using SQL. Each of the two questions will be broken down into smaller sub questions as follows:

Determine how many employees are in a position to retire and their titles

Create a Retirement Titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955.

Because some employees may have multiple titles in the database—for example, due to promotions— we need to create a table that contains the most recent title of each employee.

Finally, create a final table that has the number of retirement-age employees grouped by most recent job title.

Determine the employees eligible for the Mentorship Program

Create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.
## Results
The first question asked is how many employees are in a position to retire? To visualize question, it will be broken down into sub-questions.

* First We need a table of all the employees born between January 1, 1952 and December 31, 1955:

![s1](https://user-images.githubusercontent.com/111541268/194394267-e0f6260d-b513-4d37-9378-6ecf34f1fee0.png)

This block of SQL will return the Employee Number, First Name, Last Name, Title, From Date, and To Date of all the employees who are born between 1952 and 1955. This puts us close to our answer, but not quite because this list includes many duplicate entries for employees who have multiple titles.

* Next we need to remove all of the duplicate records and make a table of all unique employees by only including their most recent title:
![s2](https://user-images.githubusercontent.com/111541268/194394324-37092ec1-c820-449d-bee9-029f3974d224.png)


running this query will result in a table containing unique employee entries and their most recent title:


![s3](https://user-images.githubusercontent.com/111541268/194394355-6cb08d27-c001-43b5-92e9-c852a577cf4a.png)

* Finally to visualize the amount of each title that will be retiring, we will group the table by titles, and present a total count:
![s4](https://user-images.githubusercontent.com/111541268/194394478-8af26230-f916-4608-85cf-493468346928.png)

Running this query will result in the following table:

![s5](https://user-images.githubusercontent.com/111541268/194394503-e940daa0-8ec5-46b8-9ab5-dcb0a57d74f3.png)

The second task we need to complete compile a list of all the current employees eligible for a mentorship program. This one is a little more straight-forward. All we have to do is adjust or original query birthdate range and add a second filter, to filter out employees no longer employed.

* Refactor the original query. We will adjust the birthdate to include employees born in 1965. We then filter those to only include employees still employed by Pewlett-Hackard by filtering the to_date = 9999-01-01. This will result in a table holding information about all of the employees currently employed by Pewlett-Hackard, born in 1965, and their most recent titles.
![s6](https://user-images.githubusercontent.com/111541268/194394555-49f99d6f-91d9-4a86-9a55-ec428cee38fb.png)


## Summary
How many roles will need to be filled as the "silver tsunami" begins to make an impact?

* If we take a look at the Retirement Title Count table, it clearly shows how many potential employees will be retiring from each position. This means, at some point in the near future, that many roles will need to be filled by new hires:


* One problem with these numbers, though, is it includes both current and non-current employees. This fact makes for highly inaccurate forecasting. If we modify the table, and query only active employees who have all the same criteria, we get a more accurate measure of the number of employees about to retire:

![s5](https://user-images.githubusercontent.com/111541268/194394626-e8455415-502f-4a2c-9506-00a0cb0f4d28.png)

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

* This answer requires a new query, one to compile the count of all the eligible Mentors into a table grouped by title, to make an easy comparison to those employees who are retiring and will need their spots filled:

![s7](https://user-images.githubusercontent.com/111541268/194394644-6b4b8606-c160-429d-ad6a-cb83a52c499b.png)

Comparing this table to the more accurate retirement table, you can see that in a worst case scenario, where all of the retirement eligible employees quit at the same time, the eligible mentors could take on new hires at around a 2:1 to 3:1 ratio for senior staff and senior engineers. The ratios then jump quite drastically to around 14:1 for engineers, 13:1 for staff, 20:1 for technique leaders, and finally 8:1 for assistant engineers. This, however, is highly unlikely to occur, and with the given mentors, Pewlett-Hackard should have more than enough mentors to guide any new hires.
