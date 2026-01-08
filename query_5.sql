-- 5. PAYROLL AND COMPENSATION ANALYSIS
select * from payroll;
-- What is the total monthly payroll processed?
SELECT YEAR(date) AS Year, MONTH(date) AS Month, 
       SUM(total_amount) AS MonthlyPayroll
FROM Payroll
GROUP BY YEAR(date), MONTH(date)
ORDER BY Year, Month;


-- What is the average bonus given per department?
SELECT jd.jobdept, AVG(sb.amount) AS AvgBonus
FROM SalaryBonus sb
JOIN Employee e ON sb.job_ID = e.emp_ID
JOIN JobDepartment jd ON e.job_ID = jd.job_ID
GROUP BY jd.jobdept;


-- Which department receives the highest total bonuses?
SELECT jd.jobdept, SUM(sb.amount) AS TotalBonuses
FROM SalaryBonus sb
JOIN Employee e ON sb.job_ID = e.emp_ID
JOIN JobDepartment jd ON e.job_ID = jd.job_ID
GROUP BY jd.jobdept
ORDER BY TotalBonuses DESC
LIMIT 1;


-- What is the average value of total_amount after considering leave deductions?
SELECT AVG(total_amount) AS AvgNetPayroll
FROM Payroll;
