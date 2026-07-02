# Adventure Works – Global Sales Analysis (SQL + Excel)

## 📌 Project Overview
This project analyzes global sales data for **Adventure Works**, a fictional bicycle company operating in North America, Europe, and Asia.  
The goal was to clean messy raw data and extract actionable business insights using **Excel (cleaning)** and **SQL (analysis & reporting)**.

## 🎯 Project Goals
- Clean and standardize raw sales data using Excel  
- Write SQL queries to track KPIs: **Revenue**, **Profit**, **Return Rates**  
- Identify **Top 10 Products** and **Top 10 Customers**  
- Analyze **seasonal sales trends** by year and month  
- Provide data-driven recommendations to improve profitability

## 🛠️ Tools Used
| Tool | Purpose |
|------|---------|
| **Microsoft Excel** | Data cleaning – removed duplicates, fixed date formats, handled null values |
| **MySQL** | Data extraction, joins, aggregations, date functions, KPI calculations |

## 📊 Key SQL Queries Included
| Query | Description |
|-------|-------------|
| `Top_10_Products.sql` | Ranks products by total revenue using `JOIN` + `SUM` + `ORDER BY` + `LIMIT` |
| `Top_10_Customers.sql` | Ranks customers by total purchase value |
| `Sales_by_Year.sql` | Groups sales by year to track growth trends |
| `Sales_by_Month.sql` | Uses `MONTH(OrderDateKey)` to identify seasonal peaks |
| `Return_Rate_Analysis.sql` | Calculates return % using conditional aggregation |
| `Seasonal_Trends.sql` | Combines year + month to spot recurring patterns |

## 🔍 Key Insights Discovered
- **Sales peak in June and December** – indicating summer and holiday buying seasons  
- **Top 10 customers contribute ~35% of total revenue** – retention is critical  
- **2 products had return rates above 15%** – flagged for quality/marketing review  

## 📂 Repository Structure
Adventure-Works-SQL-Analysis/
├── README.md
├── SQL_Queries/ # All SQL scripts used for analysis
├── Excel_Cleaning/ # Steps followed for data preparation
└── Output_Reports/ # Final CSV outputs from SQL queries


## 🚀 How to Reproduce
1. Clean the raw data in Excel (follow steps in `Excel_Cleaning/Cleaning_Steps.txt`).  
2. Import the cleaned data into MySQL database.  
3. Run the SQL scripts in the `SQL_Queries/` folder in any order.  
4. Export results as CSVs (samples in `Output_Reports/`).

## 📌 Key Learnings
- Writing complex SQL queries with `JOIN`s, `GROUP BY`, and date functions  
- Using Excel for quick data validation and cleaning  
- Translating raw data into business recommendations  

## 👩‍💻 Author
**Pratiksha Subhash Bhosale**  

## 📧 Contact
pratikshabhosale1501@gmail.com
- 💼 LinkedIn: [linkedin.com/in/profile](https://www.linkedin.com/in/pratiksha-bhosale-6b433837b/)

---
⭐ If you find this project useful, give it a star on GitHub!
