-- 2. JOB ROLE AND DEPARTMENT ANALYSIS
select * from jobdepartment;
-- How many different job roles exist in each department?
SELECT jobdept, COUNT(DISTINCT name) AS RoleCount
FROM JobDepartment
GROUP BY jobdept;


-- What is the average salary range per department?

SELECT 
    jd.jobdept AS Department,
    ROUND(AVG(sb.amount), 2) AS AvgSalary
FROM JobDepartment jd
JOIN SalaryBonus sb ON jd.Job_ID = sb.Job_ID
GROUP BY jd.jobdept
ORDER BY AvgSalary DESC;



-- Which job roles offer the highest salary?
SELECT 
    jd.name AS JobRole,
    jd.jobdept AS Department,
    MAX(sb.amount) AS HighestSalary
FROM JobDepartment jd
JOIN SalaryBonus sb ON jd.Job_ID = sb.Job_ID
GROUP BY jd.name, jd.jobdept
ORDER BY HighestSalary DESC
LIMIT 5;  

-- Which departments have the highest total salary allocation?
SELECT 
    jd.jobdept AS Department,
    SUM(sb.amount) AS TotalSalaryAllocation
FROM JobDepartment jd
JOIN SalaryBonus sb ON jd.Job_ID = sb.Job_ID
GROUP BY jd.jobdept
ORDER BY TotalSalaryAllocation DESC;
