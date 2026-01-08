-- 6. EMPLOYEE PERFORMANCE AND GROWTH

-- Which year had the highest number of employee promotions?
SELECT YEAR(p.date) AS Year, COUNT(*) AS PromotionCount
FROM Payroll p
JOIN (
    SELECT emp_ID, MIN(job_ID) AS FirstJob, MAX(job_ID) AS LatestJob
    FROM Payroll
    GROUP BY emp_ID
    HAVING COUNT(DISTINCT job_ID) > 1   -- employees who changed jobs
) promo_emp ON p.emp_ID = promo_emp.emp_ID
GROUP BY YEAR(p.date)
ORDER BY PromotionCount DESC;

