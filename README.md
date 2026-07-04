# Adventure Works – Global Sales Analysis (SQL + Excel)

## 📌 Project Overview
This project analyzes global sales data for **Adventure Works Cycles**, a fictional bicycle company operating in North America, Europe, and Asia. The business wanted to expand market share, reduce costs, and target top customers — but lacked automated reporting.

I used **Excel for data cleaning** and **MySQL for all analysis** to uncover key business KPIs and deliver actionable insights.

## 🎯 Business Problem
Adventure Works had messy, scattered raw data across multiple tables. Management couldn't easily track:
- Total revenue and profit
- Profit margins
- Year-over-year growth trends
- Top-selling products and top customers
- Seasonal sales patterns

## 🛠️ Tools Used
| Tool | Purpose |
|------|---------|
| **Microsoft Excel** | Data cleaning – removed duplicates, standardized `OrderDateKey` format, handled null values |
| **MySQL** | Data extraction, joins, aggregations, date functions, KPI calculations |

## 📊 Key Results & KPIs

| KPI | Value |
|-----|-------|
| **Total Revenue** | **$29,358,677.22** |
| **Total Cost** | $17,277,793.58 |
| **Total Profit** | **$12,080,883.65** |
| **Profit Margin** | **41.15%** |
| **Total Orders** | 60,398 |

### 📈 Sales Growth by Year
| Year | Revenue |
|------|---------|
| 2010 | $43,421.04 |
| 2011 | $7,075,525.93 |
| 2012 | $5,842,485.20 |
| **2013** | **$16,351,550.34** (Peak) |
| 2014 | $45,694.72 (Partial Data) |

> **Key Insight:** Massive **180% growth** from 2012 ($5.84M) to 2013 ($16.35M).

### 📅 Monthly Sales Trend (All 12 Months)
| Month | Revenue |
|-------|---------|
| December | $1,874,360.29 |
| November | $1,780,920.06 |
| October | $1,673,293.41 |
| June | $1,643,177.78 |
| August | $1,551,065.56 |
| September | $1,447,495.69 |
| July | $1,371,675.81 |
| May | $1,284,592.93 |
| March | $1,049,907.39 |
| April | $1,046,022.77 |
| January | $857,689.91 |
| February | $771,348.74 |

> **Key Insight:** December is the peak month — ideal for holiday marketing campaigns.

### 🏆 Top 10 Products
| Rank | Product Name | Total Sales |
|------|--------------|-------------|
| 1 | Mountain-200 Black, 46 | $1,373,469.55 |
| 2 | Mountain-200 Black, 42 | $1,363,142.09 |
| 3 | Mountain-200 Silver, 38 | $1,339,462.79 |
| 4 | Mountain-200 Silver, 46 | $1,301,100.10 |
| 5 | Mountain-200 Black, 38 | $1,294,866.14 |
| 6 | Mountain-200 Silver, 42 | $1,257,434.57 |
| 7 | Road-150 Red, 48 | $1,205,876.99 |
| 8 | Road-150 Red, 62 | $1,202,298.72 |
| 9 | Road-150 Red, 52 | $1,080,637.54 |
| 10 | Road-150 Red, 56 | $1,055,589.65 |

> **Key Insight:** Mountain-200 series dominates the Top 6 — focus inventory and promotions here.

### 👤 Top 10 Customers
| Rank | Customer Name | Total Sales |
|------|---------------|-------------|
| 1 | Nichole Nara | $13,295.38 |
| 2 | Kaitlyn Henderson | $13,294.27 |
| 3 | Margaret He | $13,269.27 |
| 4 | Randall Dominguez | $13,265.99 |
| 5 | Adriana Gonzalez | $13,242.70 |
| 6 | Rosa Hu | $13,215.65 |
| 7 | Brandi Gill | $13,195.64 |
| 8 | Brad She | $13,173.19 |
| 9 | Francisco Sara | $13,164.64 |
| 10 | Maurice Shan | $12,909.67 |

> **Key Insight:** Top customers are tightly clustered (~$13k) — small incentives could push them higher.

## 🗃️ SQL Queries Included
| File | Description |
|------|-------------|
| `01_Overall_KPIs.sql` | Total revenue, cost, profit, orders, and profit margin |
| `02_Sales_by_Year.sql` | Year-over-year revenue trends |
| `03_Sales_by_Month.sql` | Monthly revenue for all years / peak year |
| `04_Top_10_Products.sql` | Best-selling products (JOIN with `dimproduct`) |
| `05_Top_10_Customers.sql` | Highest-spending customers (JOIN with `dimcustomer`) |

## 📌 Recommendations
- **Stock up** on Mountain-200 bikes before **December** (holiday peak).
- Launch **targeted holiday campaigns** in November–December.
- Offer **loyalty programs** to top customers like Nichole Nara.
- Investigate **2014 drop** (likely incomplete data) — ensure full-year tracking.

## 👩‍💻 Author
**Pratiksha Subhash Bhosale**  

## 📧 Contact
pratikshabhosale1501@gmail.com
- 💼 LinkedIn: [linkedin.com/in/profile](https://www.linkedin.com/in/pratiksha-bhosale-6b433837b/)

---
⭐ If you find this project useful, give it a star on GitHub!
