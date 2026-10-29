SELECT g.Name AS genre,
       ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue,
       SUM(il.Quantity) AS tracks_sold,
       ROUND(SUM(il.UnitPrice * il.Quantity) / SUM(il.Quantity), 2) AS avg_unit_price  
FROM InvoiceLine il
JOIN Track t ON t.TrackId = il.TrackId
JOIN Genre g ON g.GenreId = t.GenreId
GROUP BY g.Name
ORDER BY revenue DESC;