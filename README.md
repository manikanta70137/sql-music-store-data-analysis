# SQL Music Store Data Analysis

This project focuses on analyzing a digital music store database using SQL to answer real-world business questions related to customers, sales, artists, genres, and revenue trends.

The project demonstrates end-to-end SQL skills including relational schema design, data loading, data integrity handling, and analytical querying.

---

## Skills Demonstrated
- Relational database design with foreign key constraints
- Data loading using MySQL Data Import Wizard and CSV-based bulk load
- Handling NULL values during large dataset import
- Complex joins across multiple tables
- Aggregations, subqueries, and window functions
- Business-focused analytical problem solving using SQL

---

## Project Structure
```bash
sql-music-store-data-analysis/
│
├── schema/
│ └── music_store_schema.sql
│
├── data-loading/
│ └── track_data_load.sql
│
├── analysis-queries/
│ └── music_store_analysis.sql
│
├── screenshots/
│ └── query_results.png
│
├── docs/
│ └── Music_Store_Data_Analysis.pdf
│
└── README.md
```

---

## Data Loading Approach

- **Track table** data was loaded using a CSV file with `LOAD DATA LOCAL INFILE` to handle a large dataset and missing values efficiently.
- **All other tables** (Employee, Customer, Invoice, InvoiceLine, Artist, Album, Genre, etc.) were populated using **MySQL Data Import Wizard**.

This approach reflects real-world scenarios where different data sources and ingestion methods are used based on data volume and structure.

---

## Business Questions Answered

- Who is the senior-most employee based on job role?
- Which countries and cities generate the highest revenue?
- Who are the top customers by total spending?
- What are the most popular music genres by country?
- Which artists contribute the most to Rock music?
- How much does each customer spend on different artists?
- Which tracks are longer than the average duration?

---

## Sample Query Results

### Top Customers by Total Spending
![Top Customers by Spending](screenshots/top_customers_by_spending.png)

### Revenue by Country
![Revenue by Country](screenshots/top_countries_by_revenue.png)

### Revenue by City
![Revenue by City](screenshots/revenue_by_city.png)

### Top Artists by Revenue
![Top Artists by Revenue](screenshots/top_artists_by_revenue.png)

### Most Popular Genre by Country
![Most Popular Genre by Country](screenshots/most_popular_genre_by_country.png)


## How to Run the Project

1. Execute the database schema script:
2. Load Track data using:
3. Run analytical queries from:

---

## Tools Used
- SQL
- MySQL
- MySQL Workbench (Data Import Wizard)
- CSV datasets

---

## Author
**Manikanta Chundu**
