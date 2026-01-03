# 🏠 Real Estate Market Analysis (SQL EDA)

## 📌 Project Overview
This project focuses on performing **end-to-end Exploratory Data Analysis (EDA)** on a real estate listings dataset using **pure SQL (MySQL)**.  
The goal is to understand **pricing behavior**, **market structure**, and **feature impact** while making **defensible data quality decisions**—similar to how analysis is done in real industry environments.

Rather than jumping directly to visualization, the project emphasizes **data validation, analytical reasoning, and business-driven insights**.

---

## 🛠 Tools & Technologies
- **MySQL** – Database & querying
- **SQL** – Data exploration and aggregation
- **Power BI** *(planned)* – Visualization & storytelling

---

## 📂 Dataset Description
- ~20,000 real estate listings
- Represents **active properties (`for_sale`)**
- Key attributes include:
  - Price
  - Bedrooms, bathrooms
  - House size
  - Land size (`acre_lot`)
  - Location (city, state, zip code)

⚠️ Note: The dataset does **not** contain sold transactions.

---

## 🎯 Business Problem
**Primary Question:**
> What factors influence property prices, and how does the real estate market differ across locations and property features?

**Why this matters:**
- Helps understand market structure (luxury vs mass-market)
- Prevents misleading insights caused by skewed or dirty data
- Supports pricing strategy and market positioning

---

## 🔍 EDA Methodology (Phase-wise)

### 🔹 Phase 1: Data Health & Validation
**Objective:** Determine whether the dataset is reliable for analysis.

- Verified total row count
- Checked property status distribution
- Assessed column data types and missing values

**Key Finding:**
- All records are `for_sale`, meaning the dataset represents **current listings**, not historical sales.

---

### 🔹 Phase 2: Price Distribution & Outliers
**Objective:** Understand overall pricing behavior.

- Identified extremely wide price range
- Detected heavy skew caused by ultra-luxury properties
- Validated that high prices were legitimate (not data entry errors)

**Insight:**
- Average price alone is misleading due to outliers
- Segmentation is required for meaningful analysis

---

### 🔹 Phase 3: Location-Based Analysis
**Objective:** Compare markets by price and volume.

- Calculated average price by city
- Analyzed listing count by city

**Key Insight:**
- Cities with highest prices are **not** the same as cities with highest listings
- Clear separation between **luxury markets** and **high-volume markets**

---

### 🔹 Phase 4: Feature Impact Analysis
**Objective:** Identify which property features drive price.

Features analyzed:
- Bedrooms
- Bathrooms
- House size (binned)

**Key Findings:**
- Price increases with bedrooms, but non-linearly
- Bathrooms are a stronger indicator of luxury than bedrooms
- House size shows diminishing returns beyond a certain point

---

### 🔹 Phase 5: Data Quality & Cleaning Decisions
**Objective:** Handle unreliable data responsibly.

- Investigated `acre_lot` column
- Found inconsistent and unrealistic values
- Avoided blind transformations or forced cleaning

**Decision:**
- Excluded or conditionally filtered `acre_lot` instead of corrupting analysis

**Key Principle:**
> NULL is information. Poor cleaning is worse than no cleaning.

---

## 📊 Key Business Insights
- Real estate prices are highly skewed by luxury listings
- Market value and market volume behave differently across cities
- Bathrooms and house size are strong indicators of premium pricing
- Data quality decisions directly impact analytical accuracy

---

## 💼 Business Value
- Helps differentiate luxury vs mass-market locations
- Supports pricing strategy and market understanding
- Demonstrates disciplined, industry-style EDA practices

---

## 📈 Future Enhancements
- Build interactive **Power BI dashboard**
- Add geographic visualizations
- Apply price segmentation for deeper insights

---

## 🧠 Key Learnings
- EDA is about **thinking**, not just querying
- Always validate data before analysis
- Aggregations must align with business questions
- Cleaning decisions must be justified, not assumed

---

## 🏁 Conclusion
This project demonstrates a **structured, SQL-driven EDA workflow** focused on data quality, analytical reasoning, and business relevance.  
It reflects how real-world analysts explore data before modeling or visualization.

---

📌 *Author:* Tejas Shinde  
📌 *Focus Area:* Data Analytics / SQL / EDA  
