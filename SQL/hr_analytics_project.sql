create database hr_analytics;
use hr_analytics;
-- displaying the dataset

select * from hr_employees;

-- 1. total employees
select count(*) as total_employees
from hr_employees;

-- 2. Attrition Count
select Attrition, count(*) as employee_count
from hr_employees
group by Attrition;

-- 3. Attrition Rate
SELECT 
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS attrition_rate
FROM hr_employees;

-- 4. Department-wise Employees
SELECT Department,
COUNT(*) AS total_employees
FROM hr_employees
GROUP BY Department
ORDER BY total_employees DESC;

-- 5. Department-wise Attrition
select department,
count(*) as attrition_count
from hr_employees
where Attrition = 'yes'
group by department
order by attrition_count desc;

-- 6. Average Salary by Department
select department, avg(MonthlyIncome) as avg_salary
from hr_employees
group by department
order by avg_salary desc;

-- 7 gender distribution 
select gender,count(*) as gender_count
from hr_employees
group by gender;

-- 8. Overtime vs Attrition
SELECT OverTime,
Attrition,
COUNT(*) AS total
FROM hr_employees
GROUP BY OverTime, Attrition;

-- 9. Job Role Salary Analysis
select JobRole,
avg(MonthlyIncome) as avg_salary
from hr_employees
group by JobRole
order by avg_salary desc;

-- 10. Experience Analysis
select yearsatcompany,
count(*) as employees_count
from hr_employees
group by yearsatcompany
order by yearsatcompany;