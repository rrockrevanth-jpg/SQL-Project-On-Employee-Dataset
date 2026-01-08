-- 4. LEAVE AND ABSENCE PATTERNS
select * from leaves;
-- Which year had the most employees taking leaves?
SELECT YEAR(date) AS Year, COUNT(DISTINCT emp_ID) AS EmployeesOnLeave
FROM Leaves
GROUP BY YEAR(date)
ORDER BY EmployeesOnLeave DESC
LIMIT 1;


-- What is the average number of leave days taken by its employees per department?
SELECT jd.jobdept, AVG(LeaveCount) AS AvgLeaveDays
FROM (
    SELECT e.emp_ID, COUNT(l.leave_ID) AS LeaveCount
    FROM Employee e
    JOIN Leaves l ON e.emp_ID = l.emp_ID
    GROUP BY e.emp_ID
) empLeaves
JOIN Employee e ON empLeaves.emp_ID = e.emp_ID
JOIN JobDepartment jd ON e.job_ID = jd.job_ID
GROUP BY jd.jobdept;


-- Which employees have taken the most leaves?
SELECT e.emp_ID, e.firstname, e.lastname, COUNT(l.leave_ID) AS TotalLeaves
FROM Employee e
JOIN Leaves l ON e.emp_ID = l.emp_ID
GROUP BY e.emp_ID, e.firstname, e.lastname
ORDER BY TotalLeaves DESC
LIMIT 5;


-- What is the total number of leave days taken company-wide?
SELECT COUNT(*) AS TotalLeaveDays
FROM Leaves;


-- How do leave days correlate with payroll amounts?
select * from salarybonus;
SELECT e.emp_ID, e.firstname, e.lastname,
       COUNT(l.leave_ID) AS TotalLeaves,
       SUM(sb.amount) AS TotalPayroll
FROM Employee e
LEFT JOIN Leaves l ON e.emp_ID = l.emp_ID
LEFT JOIN salarybonus sb ON e.emp_ID = sb.Job_ID
GROUP BY e.emp_ID, e.firstname, e.lastname
ORDER BY TotalLeaves DESC;
