-- 1. EMPLOYEE INSIGHTS
-- How many unique employees are currently in the system?
SELECT COUNT(DISTINCT emp_ID) AS total_employees FROM Employee;

-- Which departments have the highest number of employees?
SELECT 
    jd.jobdept AS Department,
    COUNT(e.emp_ID) AS NumberOfEmployees
FROM 
    JobDepartment jd
LEFT JOIN 
    Employee e ON jd.Job_ID = e.Job_ID
GROUP BY 
    jd.jobdept
ORDER BY 
    NumberOfEmployees DESC;
-- Average Salary Per Department
SELECT jd.jobdept AS Department,
    ROUND(AVG(sb.amount), 2) AS AverageSalary
FROM 
    JobDepartment jd
JOIN 
    Employee e ON jd.Job_ID = e.Job_ID
JOIN 
    SalaryBonus sb ON jd.Job_ID = sb.Job_ID
GROUP BY 
    jd.jobdept
ORDER BY 
    AverageSalary DESC;

-- top 5 highest-paid employees
select * from employee;
SELECT 
    e.Emp_ID,
    e.firstname AS EmployeeName,
    jd.jobdept AS Department,
    sb.amount AS Salary
FROM Employee e
JOIN JobDepartment jd ON e.Job_ID = jd.Job_ID
JOIN SalaryBonus sb ON e.Job_ID = sb.Job_ID
ORDER BY sb.amount DESC
LIMIT 5;

 -- total salary expenditure across the company
 
 SELECT 
    SUM(sb.amount) AS TotalSalaryExpenditure
FROM Employee e
JOIN JobDepartment jd ON e.Job_ID = jd.Job_ID
JOIN SalaryBonus sb ON e.Job_ID = sb.Job_ID;
