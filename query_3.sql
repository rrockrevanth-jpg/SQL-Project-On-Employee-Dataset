-- 3. QUALIFICATION AND SKILLS ANALYSIS
select * from qualification;
-- How many employees have at least one qualification listed?
SELECT COUNT(DISTINCT Emp_ID) AS EmployeesWithQualifications
FROM Qualification;

-- Which positions require the most qualifications?
SELECT Position, COUNT(QualID) AS TotalQualifications
FROM Qualification
GROUP BY Position
ORDER BY TotalQualifications DESC;

-- Which employees have the highest number of qualifications?
select * from employee;
SELECT e.emp_ID, e.firstname, e.lastname, COUNT(q.QualID) AS QualificationCount
FROM Employee e
JOIN Qualification q ON e.emp_ID = q.emp_ID
GROUP BY e.Emp_ID, e.firstname, e.lastname
ORDER BY QualificationCount DESC;
