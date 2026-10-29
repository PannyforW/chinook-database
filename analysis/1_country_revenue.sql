SELECT BillingCountry,
       ROUND(SUM(Total), 2) AS revenue,
       COUNT(*) AS invoice_count,
       ROUND(SUM(Total) / COUNT(*), 2) AS avg_invoice_value   
FROM Invoice
GROUP BY BillingCountry
ORDER BY revenue DESC;