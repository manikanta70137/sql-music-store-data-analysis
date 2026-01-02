-- Music Store Business Analysis
-- Author: Manikanta Chundu
-- Description: SQL queries answering real-world business
-- questions related to revenue, customers, artists, and genres.

/* Q1: Senior most employee based on job title */
SELECT first_name, last_name, title
FROM Employee
ORDER BY title DESC
LIMIT 1;

/* Q2: Countries with the most invoices */
SELECT billing_country, COUNT(*) AS total_invoices
FROM Invoice
GROUP BY billing_country
ORDER BY total_invoices DESC;

/* Q3: Top 3 invoice totals */
SELECT invoice_id, total
FROM Invoice
ORDER BY total DESC
LIMIT 3;

/* Q4: City generating highest revenue */
SELECT billing_city, SUM(total) AS total_revenue
FROM Invoice
GROUP BY billing_city
ORDER BY total_revenue DESC
LIMIT 1;

/* Q5: Best customer by total spending */
SELECT c.customer_id, c.first_name, c.last_name, SUM(i.total) AS total_spent
FROM Customer c
JOIN Invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 1;

/* Q6: Rock music listeners for marketing */
SELECT DISTINCT c.email, c.first_name, c.last_name
FROM Customer c
JOIN Invoice i ON c.customer_id = i.customer_id
JOIN InvoiceLine il ON i.invoice_id = il.invoice_id
JOIN Track t ON il.track_id = t.track_id
JOIN Genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
ORDER BY c.email;

/* Q7: Top artists producing Rock tracks */
SELECT ar.name, COUNT(*) AS track_count
FROM Artist ar
JOIN Album al ON ar.artist_id = al.artist_id
JOIN Track t ON al.album_id = t.album_id
JOIN Genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
GROUP BY ar.artist_id
ORDER BY track_count DESC
LIMIT 10;

/* Q8: Tracks longer than average duration */
SELECT name, milliseconds
FROM Track
WHERE milliseconds > (SELECT AVG(milliseconds) FROM Track);

/* Q9: Customer spending per artist */
SELECT c.first_name, c.last_name, ar.name, SUM(il.unit_price * il.quantity) AS total_spent
FROM Customer c
JOIN Invoice i ON c.customer_id = i.customer_id
JOIN InvoiceLine il ON i.invoice_id = il.invoice_id
JOIN Track t ON il.track_id = t.track_id
JOIN Album al ON t.album_id = al.album_id
JOIN Artist ar ON al.artist_id = ar.artist_id
GROUP BY c.customer_id, ar.artist_id
ORDER BY total_spent DESC;
