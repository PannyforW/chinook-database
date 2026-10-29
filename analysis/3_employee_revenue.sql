SELECT e.FirstName || ' ' || e.LastName AS employee,
       COUNT(DISTINCT c.CustomerId) AS customers,
       ROUND(SUM(i.Total), 2) AS revenue,
       ROUND(1.0 * SUM(i.Total) / COUNT(DISTINCT c.CustomerId), 2) AS revenue_per_customer   
FROM Employee e
JOIN Customer c ON c.SupportRepId = e.EmployeeId
JOIN Invoice i ON i.CustomerId = c.CustomerId
GROUP BY e.EmployeeId
ORDER BY revenue DESC;