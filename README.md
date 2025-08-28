# Vanguard CX A/B Testing

**House Lannister** - Eppu • Noid

---

## 🧠 Project Overview
We are a newly employed data analyst in the Customer Experience (CX) team at Vanguard, the US-based investment management company. We've been thrown straight into the deep end with our first task. Before our arrival, the team launched an exciting digital experiment, and now, they're eagerly waiting to uncover the results and need our help!

The digital world is evolving, and so are Vanguard’s clients. Vanguard believed that a more intuitive and modern User Interface (UI), coupled with timely in-context prompts (cues, messages, hints, or instructions provided to users directly within the context of their current task or action), could make the online process smoother for clients. **The critical question was: Would these changes encourage more clients to complete the process?**

An A/B test was set into motion from 3/15/2017 to 6/20/2017 by the team.

**Control Group:** Clients interacted with Vanguard's traditional online process.

**Test Group:** Clients experienced the new, spruced-up digital interface.
Both groups navigated through an identical process sequence: an initial page, three subsequent steps, and finally, a confirmation page signaling process completion.

The goal is to see if the new design leads to a better user experience and higher process completion rates.

---

## 🎯 Objectives (Hypotheses)
1) **Is there a statistically significan difference in Completion Rate?**  
2) **Is there a statistically significan difference in Time Spent per Step?**  
3) **Is there a statistically significan difference in Error Rate?**

---

## 🗺️ Data & Modeling
- **Data prep:** cleaned CSV → **staging table** → transformed into a normalized schema.  
- **Schema (core tables):** `data` (client_id, visitor_id, visit_id, process step, date_time), `demo` (info about the demographics),  `experiment` (if client_id belonged to 'Test' or 'Contro' group)
- **ERD approach:** primary/foreign keys with `client_id` at the center, enabling joins for demo and experiment.

---

## 🔍 Methodology
- Load cleaned CSV to **staging** (pandas / Workbench Wizard).  
- Transform and normalize into the ERD tables.  
- Write analytical SQL (**GROUP BY**, **JOIN**, **WINDOW** functions like `LAG`) for time_spent per step.
- Create csv's in SQL Workbench or query directly with python using **pymysql** 
- Validate with quick sanity checks (row counts, NULLs, dublicates, types).
- Using a variety of statistical test to validate our findings.

---

## 📊 Key Findings (Short)
- **Completion Rate:** Test group performed better and results are statistically significant.  
- **Time Spent per Step:** Test group performed better and results are statistically significant. 
- **Error Rate:** Test group performed better and results are statistically significant.

---

## 🧰 Tech Stack
- **Database:** MySQL (Workbench for ERD/inspection; SQLAlchemy + PyMySQL from Jupyter).  
- **Python:** pandas for cleaning and exports; Jupyter for the ETL + analysis notebook; seaborn and matplotlib for vozualisations; statsmodels for statistical testing.

---

## 🗂️ Repository Structure
```
wine dataset/
├─ SQL queries compillation/
│
├─ canva slides/
│  
├─ data/
│
├─ erd/
│
├─ notebooks/

---


## 🙌 Credits
House Lannister — analysis, modeling, and presentation.

---
