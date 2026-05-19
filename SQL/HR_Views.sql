CREATE VIEW hr_analytics_summary AS

SELECT
    -- Q1: Total Employees
    (SELECT COUNT(*) FROM hr_employees) AS total_employees,

    -- Q2: Attrition Count
    (SELECT COUNT(*) FROM hr_employees WHERE Attrition = 'Yes') AS attrition_yes,
    (SELECT COUNT(*) FROM hr_employees WHERE Attrition = 'No') AS attrition_no,

    -- Q3: Attrition Rate
    (SELECT ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) FROM hr_employees) AS attrition_rate_pct,

    -- Q4 & Q5 & Q6: Department-wise (Employees, Attrition, Avg Salary)
    (SELECT COUNT(*) FROM hr_employees WHERE Department = 'Research & Development') AS rd_total_employees,
    (SELECT COUNT(*) FROM hr_employees WHERE Department = 'Sales') AS sales_total_employees,
    (SELECT COUNT(*) FROM hr_employees WHERE Department = 'Human Resources') AS hr_total_employees,

    (SELECT COUNT(*) FROM hr_employees WHERE Department = 'Research & Development' AND Attrition = 'Yes') AS rd_attrition,
    (SELECT COUNT(*) FROM hr_employees WHERE Department = 'Sales' AND Attrition = 'Yes') AS sales_attrition,
    (SELECT COUNT(*) FROM hr_employees WHERE Department = 'Human Resources' AND Attrition = 'Yes') AS hr_attrition,

    (SELECT ROUND(AVG(MonthlyIncome), 2) FROM hr_employees WHERE Department = 'Research & Development') AS rd_avg_salary,
    (SELECT ROUND(AVG(MonthlyIncome), 2) FROM hr_employees WHERE Department = 'Sales') AS sales_avg_salary,
    (SELECT ROUND(AVG(MonthlyIncome), 2) FROM hr_employees WHERE Department = 'Human Resources') AS hr_avg_salary,

    -- Q7: Gender Distribution
    (SELECT COUNT(*) FROM hr_employees WHERE Gender = 'Male') AS male_count,
    (SELECT COUNT(*) FROM hr_employees WHERE Gender = 'Female') AS female_count,

    -- Q8: Overtime vs Attrition
    (SELECT COUNT(*) FROM hr_employees WHERE OverTime = 'Yes' AND Attrition = 'Yes') AS overtime_yes_attrition_yes,
    (SELECT COUNT(*) FROM hr_employees WHERE OverTime = 'Yes' AND Attrition = 'No') AS overtime_yes_attrition_no,
    (SELECT COUNT(*) FROM hr_employees WHERE OverTime = 'No' AND Attrition = 'Yes') AS overtime_no_attrition_yes,
    (SELECT COUNT(*) FROM hr_employees WHERE OverTime = 'No' AND Attrition = 'No') AS overtime_no_attrition_no,

    -- Q9: Top Job Role Salaries
    (SELECT ROUND(AVG(MonthlyIncome), 2) FROM hr_employees WHERE JobRole = 'Manager') AS manager_avg_salary,
    (SELECT ROUND(AVG(MonthlyIncome), 2) FROM hr_employees WHERE JobRole = 'Research Director') AS research_director_avg_salary,
    (SELECT ROUND(AVG(MonthlyIncome), 2) FROM hr_employees WHERE JobRole = 'Healthcare Representative') AS healthcare_rep_avg_salary,
    (SELECT ROUND(AVG(MonthlyIncome), 2) FROM hr_employees WHERE JobRole = 'Manufacturing Director') AS manufacturing_director_avg_salary,
    (SELECT ROUND(AVG(MonthlyIncome), 2) FROM hr_employees WHERE JobRole = 'Sales Executive') AS sales_executive_avg_salary,
    (SELECT ROUND(AVG(MonthlyIncome), 2) FROM hr_employees WHERE JobRole = 'Sales Representative') AS sales_rep_avg_salary,

    -- Q10: Avg Years at Company
    (SELECT ROUND(AVG(YearsAtCompany), 2) FROM hr_employees) AS avg_years_at_company,
    (SELECT MAX(YearsAtCompany) FROM hr_employees) AS max_years_at_company,
    (SELECT MIN(YearsAtCompany) FROM hr_employees) AS min_years_at_company;