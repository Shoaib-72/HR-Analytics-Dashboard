# IBM HR Analytics Dashboard

An end-to-end HR Analytics project built on the IBM HR Employee Attrition dataset.
Covers data exploration in MySQL and interactive visualization in Power BI.

---

## Tools Used
- **MySQL Workbench** — data exploration & summary view
- **Power BI** — interactive 3-page dashboard

---

---

## Dashboard Pages

### 1. HR Overview
- 1,470 total employees | 16.12% attrition rate
- Average salary: $6,500 | Average age: 36.9
- Gender split: 60% Male, 40% Female
- Largest dept: R&D (961 employees)

### 2. Attrition Analysis
- 237 employees left the organization
- Overtime workers: 30.5% attrition vs 10.4% for non-overtime
- R&D most affected (133), followed by Sales (92)
- Single employees show highest attrition (120 cases)

### 3. Salary Analysis
- Manager avg salary: $17.2K vs Sales Rep: $2.6K (7x gap)
- Sales dept leads with $6.96K avg salary
- Attrition peaks in first 1–5 years of tenure

---

## SQL Summary View

A single view combining all 10 queries — run once to get all KPIs:

```sql
SELECT * FROM hr_analytics_summary;
```

Returns total employees, attrition rate, dept-wise breakdown,
gender count, overtime analysis, job role salaries, and tenure stats
— all in one row.

---

## Dataset
[IBM HR Analytics Employee Attrition & Performance](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) — available on Kaggle (fictional dataset created by IBM data scientists).

---

## Screenshots

![HR Overview](Screenshots/HR%20overview.png.png)
![Attrition Analysis](Screenshots/Attrition%20analysis.png)
![Salary Analysis](Screenshots/Salary%20anlaysis.png)
