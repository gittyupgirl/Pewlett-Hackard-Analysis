# Pewlett-Hackard-Analysis

## Purpose
Pewlett-Hackard has requested an analysis of soon-to-be-retiring employees.

## 1. Overview of the Analysis
### Deliverables 
* retirement_titles.csv
* unique_titles.csv
* retiring_titles.csv
* mentorship_eligibility.csv

### Resources
* CSV files provided by Pewlett-Hackard
* QuickDBD
* PostgreSQL
* pgAdmin

## 2. Results:

Using QuickDBD, we created an ERD of the CSV files provided by Pewlett-Hackard, showing the relationships between the databases:
![image](https://user-images.githubusercontent.com/95661802/152626330-93b614d2-7b9b-4b6f-92c0-46af810bb78c.png)

After joining the databases using PostgreSQL and pgAdmin, we have delivered the following results:
* The list of retirement_titles.csv includes all the titles of employees who were born between January 1, 1952 and December 31, 1955. This file contained duplicate entries due to employees that held multiple titles in the course of their careers at Pewlett-Hackard, as well as employees that have already left the company.
* The unique_titles.csv file is a refined list of the above referenced file. It contains only the most recent titles of existing employees. 
* The retiring_titles.csv file is a total number of retiring employees aligned to each job title.
* The mentorship_eligibility.csv file is a list of all employees who are eligible to participate in the mentorship program. These are employees whose birth dates are between January 1, 1965 and December 31, 1965.

## 3. Summary:

Two questions arose from this analysis - 

Q: How many roles will need to be filled as the "silver tsunami" begins to make an impact?
A: There are 72,758 employees eligible for retirement, thus as many roles to fill. The number of roles that will need to be backfilled are as shown:
![image](https://user-images.githubusercontent.com/95661802/152628067-4de86d53-0a43-4a96-a1b0-c8fe130c57e8.png)


Q: Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
A: There are 1,549 employees eligible to mentor the next generation. Clearly not enough coverage.

### Additional insight

In the process of my analysis, two interesting data points arose. 
1. Lack of employee raises
2. Of the 9 departments we were provided data for, only 5 departments have active managers. Surely this cannot be correct, and calls into question the accuracy of the raw data.
![image](https://user-images.githubusercontent.com/95661802/152628301-be4d7348-19e2-4781-829c-1a75c10ba13a.png)

