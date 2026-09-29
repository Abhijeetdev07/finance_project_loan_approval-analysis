# 🏦 Bank Loan Approved Analysis

> **An end-to-end data analytics project** covering data cleaning, SQL analysis, and interactive Power BI dashboards to understand loan approval patterns across demographics, credit risk, property areas, and income groups.

---

## 📋 Table of Contents

- [Project Overview](#project-overview)
- [Tech Stack](#tech-stack)
- [Dataset](#dataset)
- [Project Structure](#project-structure)
- [SQL Analysis](#sql-analysis)
- [Power BI Dashboard](#power-bi-dashboard)
- [Key Insights & Recommendations](#key-insights--recommendations)
- [How to Run](#how-to-run)

---

## 📌 Project Overview

This project analyzes a **bank loan dataset** to answer real-world business questions about loan approvals. The workflow spans the full analytics pipeline:

1. **Raw Data Ingestion** — Original CSV with 614 loan applications
2. **Data Cleaning** — Python (Jupyter Notebook) used to handle nulls, rename columns, and engineer features
3. **SQL Analysis** — MySQL queries answering 25+ business questions across 5 sections
4. **Power BI Visualization** — Four-page interactive dashboard with slicers and cross-filtering

The goal is to help bank decision-makers understand **who gets approved, why, and where to focus resources**.

---

## 🛠️ Tech Stack

| Layer | Tool |
|---|---|
| Data Cleaning | Python · Pandas · Jupyter Notebook |
| Database | MySQL |
| Visualization | Power BI Desktop |
| Data Format | CSV |

---

## 📂 Dataset

### `loan_approved.csv` — Raw Data (614 rows)
| Column | Description |
|---|---|
| `Loan_ID` | Unique loan application identifier |
| `Gender` | Applicant gender (Male / Female) |
| `Married` | Marital status (Yes / No) |
| `Dependents` | Number of dependents |
| `Education` | Graduate / Not Graduate |
| `Self_Employed` | Yes / No |
| `ApplicantIncome` | Monthly income of applicant |
| `CoapplicantIncome` | Monthly income of co-applicant |
| `LoanAmount` | Requested loan amount (in thousands) |
| `Loan_Amount_Term` | Repayment term (in months) |
| `Credit_History` | 1 = Good credit history, 0 = No credit history |
| `Property_Area` | Urban / Semiurban / Rural |
| `Loan_Status` | **Target** — Y (Approved) / N (Rejected) |

### `loan_approved_clean.csv` — Cleaned Data
- Null values imputed / removed
- Income group feature engineered (Low / Medium / High)
- Total income column derived (`ApplicantIncome + CoapplicantIncome`)
- Column `MyUnknownColumn` dropped

---

## 🗂️ Project Structure

```
g-pro/
├── loan_approved.csv           # Raw dataset
├── loan_approved_clean.csv     # Cleaned dataset (output of notebook)
├── finance.ipynb               # Jupyter Notebook — EDA & data cleaning
├── finance_project.sql         # MySQL queries — 5 sections, 25+ questions
├── finance analysis.pbix       # Power BI dashboard file
├── Business Queries.pdf        # Business problem statements
└── assets/
    ├── overall.png             # Dashboard Page 1 screenshot
    ├── demographics.png        # Dashboard Page 2 screenshot
    ├── creditris.png           # Dashboard Page 3 screenshot
    └── insight_reco.png        # Dashboard Page 4 screenshot
```

---

## 🗄️ SQL Analysis

The SQL file `finance_project.sql` is organized into **5 sections**:

### Section 1 — Basic Queries
- View first 10 records
- Count total loan applications
- List unique property areas
- Filter self-employed applicants with income > 5000
- Count approved loans

### Section 2 — Aggregation & Grouping
- Average loan amount by **education level**
- Average total income by **marital status**
- Average loan amount by **credit history**
- Approval rate by **gender**
- Approval rate by **property area**

### Section 3 — Filtering & Conditions
- Graduate, non-self-employed applicants with loan amount > 150
- Approved urban loans with good credit history
- Top 5 applicants by total income

### Section 4 — Derived Columns & CASE WHEN
- Income group classification (Low / Medium / High)
- Average loan amount per income group

### Section 5 — Subqueries & Nested Analysis
- Applicants above average loan amount
- Approval rate by self-employment status × credit history combination

---

## 📊 Power BI Dashboard

The Power BI report (`finance analysis.pbix`) features a **4-page interactive dashboard** with slicers for **Income Group**, **Education**, and **Loan Amount Term**.

---

### Page 1 — Overall Performance

![Overall Performance Dashboard](assets/overall.png)

**Key KPIs:**
- 📋 **614** total applications
- ✅ **422** approved | ❌ **192** rejected
- 📈 **68.73%** overall approval rate
- 💰 Average total income: **7.02K**
- 💳 Average loan amount: **145.75**

**Charts:**
- Donut chart — Approved vs Rejected distribution
- Bar chart — Property area approval rate (Semiurban 76.82% › Urban 65.84% › Rural 61.45%)
- Grouped bar — Applications by Income Group and Loan Status

---

### Page 2 — Demographics & Financial Profile

![Demographics & Financial Dashboard](assets/demographics.png)

**Key Insights Visualised:**
- Married applicants have higher approval counts (288 vs 134)
- Male applicants slightly outperform female (69.12% vs 66.96%)
- Graduates have higher approval rate (70.83%) vs Non-graduates (61.19%)
- Shorter loan terms (12, 60 months) show 100% approval rates
- High-income group borrows significantly more (avg 220K) than Low-income (avg 78K)

---

### Page 3 — Property & Credit Risk Analysis

![Property and Credit Risk Dashboard](assets/creditris.png)

**Key Insights Visualised:**
- Credit history = 1 accounts for **90.95%** of all applications
- Good credit history (1.0) yields **79.05% approval rate**
- No credit history (0.0) leads to **92.1% rejection rate**
- Semiurban graduates have the **highest approval rate at 77.01%**
- Scatter plot: Loan amount vs total income by loan status
- Horizontal bar: Approval rate by loan term

---

### Page 4 — Insights & Recommendations

![Insights and Recommendations Dashboard](assets/insight_reco.png)

**Summary KPIs:**
- Approval Rate: **68.73%**
- Bad credit history rejections: **192**
- Top performing region: **Semiurban (76.82%)**

---

## 💡 Key Insights & Recommendations

### Key Data Insights

| # | Finding |
|---|---|
| 1 | **Credit History is the #1 predictor** — Good history yields 79.05% approval; no history leads to 92.1% rejection |
| 2 | **Semiurban outperforms all regions** — 76.82% approval vs 65.84% (Urban) and 61.45% (Rural) |
| 3 | **Education matters** — Graduates approved at 70.83%, Non-graduates at 61.19% |
| 4 | **Low-income applicants struggle** — Lowest approval rate at 56.52% |
| 5 | **Short-term loans are safer** — 12, 60, and 120-month terms all achieve 100% approval |

### Strategic Recommendations

| # | Recommendation |
|---|---|
| 1 | **Risk-Mitigation Strategy** — Offer applicants with no credit history small loans with stricter limits instead of outright rejection to build their credit profile |
| 2 | **Market Focus Allocation** — Increase marketing efforts in Semiurban areas due to high volume and high approval rate |
| 3 | **Workflow Automation Rule** — Fast-track approvals for applicants who are Graduates **and** have good credit history (1.0) — this combination consistently yields the highest approval rates |

---

## ▶️ How to Run

### 1. Python / Jupyter Notebook
```bash
# Install dependencies
pip install pandas numpy matplotlib seaborn jupyter

# Launch the notebook
jupyter notebook finance.ipynb
```

### 2. MySQL Database
```sql
-- Create and populate the database
CREATE DATABASE bank_loan;
USE bank_loan;

-- Import loan_approved_clean.csv into a table named l_approved
-- Then run queries from finance_project.sql
```

### 3. Power BI Dashboard
1. Open **Power BI Desktop**
2. Open `finance analysis.pbix`
3. Update the data source path to point to `loan_approved_clean.csv` on your machine
4. Click **Refresh** to reload data

---
