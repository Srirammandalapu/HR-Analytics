-- 1. Joining the two tables
SELECT * FROM hr_1_table 
JOIN hr_2_table 
ON hr_1_table.EmployeeNumber = hr_2_table.Employeeid;

-- 2. Total Employees
SELECT count(employeenumber) 
AS total_employees 
FROM hr_1_table;

-- 3. Attrition Count of Employees
SELECT COUNT(Attrition) 
AS Attrition_Count_of_Employees 
FROM hr_1_table WHERE Attrition ="Yes" ;

-- 4. Attrition Count of Female Employees
SELECT COUNT(Attrition) 
AS Attrition_Count_of_Female_Employees 
FROM hr_1_table WHERE Attrition ="Yes" and Gender = "Female";

-- 5. Attrition Count of Male Employees
SELECT COUNT(Attrition) 
AS Attrition_Count_of_male_Employees 
FROM hr_1_table WHERE Attrition ="Yes" and Gender = "Male";

-- 7. Average age of Employees
SELECT round(avg(age)) 
AS Average_age 
FROM hr_1_table;

-- 8. Active Employees 
SELECT COUNT(Attrition) 
AS Active_Employees 
FROM hr_1_table WHERE Attrition ="No";

-- 9. Active Female Employees
SELECT COUNT(Attrition) 
AS Active_Female_Employees 
FROM hr_1_table WHERE Attrition ="No" and Gender = "Female";

-- 10. Active Male Employees
SELECT COUNT(Attrition) 
AS Active_Male_Employees 
FROM hr_1_table WHERE Attrition ="No" and Gender = "male";

-- 11. Total Monthly Income of Employees
SELECT sum(Monthlyincome) 
AS Total_Monthly_Income 
FROM hr_2_table;

-- 12. Average Monthly Income of Employees
SELECT round(avg(Monthlyincome)) 
AS Average_Monthly_Income 
FROM hr_2_table;

-- 13. Average Distance from Home
SELECT round(avg(distancefromhome)) 
AS Average_Distance_from_Home 
FROM hr_1_table;

-- 14. Average Years at Company
SELECT round(avg(Yearsatcompany)) 
AS Average_Years_at_Company 
FROM hr_2_table;

-- 15. Average Hourly rate of Research Scientist 
SELECT Round(avg(Hourlyrate)) 
AS Average_Hourly_rate_of_Research_Scientist 
FROM hr_1_table WHERE JobRole = "Research Scientist";

-- 16. Attrition Count for all Departments 
SELECT department ,count(Attrition) 
AS Attrition_Count 
FROM hr_1_table WHERE Attrition ="Yes" 
GROUP BY Department ORDER BY Attrition DESC; 

-- 17. Percent Salary hike by Gender
SELECT Gender, concat(round(avg(Percentsalaryhike)/49*100,2),'%')
AS Percent_Salary_hike_by_Gender 
FROM hr_1_table 
JOIN hr_2_table
ON hr_1_table.EmployeeNumber = hr_2_table.Employeeid 
GROUP BY Gender; 

-- 18. Attrition Count by marital status 
SELECT MaritalStatus, count(attrition)
AS Attrition_Count_by_marital_status 
FROM hr_1_table 
where Attrition ="Yes" GROUP BY MaritalStatus;

-- 19. Average salary of each Job role 
SELECT jobrole, round(avg(MonthlyIncome)) 
AS Average_salary_of_each_Job_role 
FROM hr_1_table 
JOIN hr_2_table ON hr_1_table.EmployeeNumber = hr_2_table.Employeeid GROUP BY jobrole;

-- 20. No of Employees worked in various Companies
SELECT numcompaniesworked, count(employeeid) 
FROM hr_2_table 
GROUP BY NumCompaniesWorked 
ORDER BY count(Employeeid) DESC; 


-- 21. Monthly income stats of Attrition by Department

SELECT Department, round(avg(monthlyincome)), count(attrition) AS Attrition_count
FROM hr_1_table JOIN hr_2_table 
ON hr_1_table.EmployeeNumber = hr_2_table.Employeeid
WHERE Attrition = "yes"
GROUP BY Department;

-- 22. Average working years for each Department 
SELECT Department, round(avg(TotalWorkingYears)) 
FROM hr_1_table JOIN hr_2_table 
ON hr_1_table.EmployeeNumber = hr_2_table.Employeeid
GROUP BY Department ORDER BY round(avg(TotalWorkingYears)) DESC ;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- 23. Job Role Vs Work life balance 
SELECT Jobrole, round(avg(worklifebalance),2) AS Worklifebalance_Rating
FROM hr_1_table JOIN hr_2_table 
ON hr_1_table.EmployeeNumber = hr_2_table.Employeeid
GROUP BY JobRole;

-- 24. No of Employees by Education Field
SELECT Educationfield, count(employeenumber) AS Employees
FROM hr_1_table
GROUP BY EducationField;

-- 25. Average Years in current role by jobrole
SELECT  Jobrole, round(avg(Yearsincurrentrole),2)
AS Average_Years_in_current_role
FROM hr_1_table JOIN hr_2_table 
ON hr_1_table.EmployeeNumber = hr_2_table.Employeeid
GROUP BY JobRole ORDER BY round(avg(Yearsincurrentrole),2) DESC;

-- 26. No of Employees by Business Travel
SELECT Businesstravel, count(employeenumber)
FROM hr_1_table
GROUP BY BusinessTravel;

-- 27. Percentage of over time by Gender
SELECT gender, concat(round(count(overtime)/25000 *100,2),'%')
AS Percentage_of_over_time_by_Gender
FROM hr_1_table JOIN hr_2_table 
ON hr_1_table.EmployeeNumber = hr_2_table.Employeeid
WHERE OverTime = "Yes"
GROUP BY Gender;

