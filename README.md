# Airbnb End-to-End Data Engineering Project  
### AWS S3 • Snowflake • dbt • Metadata-Driven Pipelines

This project demonstrates a **production-style end-to-end data engineering pipeline** built using the modern data stack.  
It leverages **metadata-driven transformations**, **dbt modeling**, and an **analytics-ready Gold layer with an OBT (One Big Table)**.

---

## 📌 Project Overview

The objective of this project is to build a scalable and configurable data pipeline that:

- Ingests raw Airbnb data from **AWS S3**
- Stores and processes data in **Snowflake**
- Uses **metadata-driven logic** for transformations
- Applies transformations using **dbt**
- Implements **Slowly Changing Dimensions (SCD Type 2)** using dbt snapshots
- Produces analytics-ready **fact tables, dimension tables, and a One Big Table (OBT)**

---

## 🧠 Key Concept: Metadata-Driven Pipelines

Instead of hardcoding transformations, this project uses **metadata tables and YAML-driven configurations** to control:

- Source-to-target mappings  
- Column selection and renaming  
- Data type enforcement  
- Incremental vs full-load behavior  
- Snapshot eligibility  

### Benefits
- ✅ Configurable without code changes  
- ✅ Scalable to new datasets  
- ✅ Easier to maintain and audit  

---

## 🧱 Architecture

```text
AWS S3 (Raw CSV Files)
        |
        v
Snowflake (RAW / STAGING)
        |
        v
dbt Transformations
(Bronze → Silver → Gold)
        |
        v
Gold Layer
- Fact Tables
- Dimension Tables
- One Big Table (OBT)
```
## 🛠️ Tech Stack

AWS S3 – Raw data storage

Snowflake – Cloud data warehouse

dbt Core – Transformations & modeling

SQL – Business logic

YAML Metadata – Pipeline configuration
```text
```
## 📂 Project Structure
```text

.
├── models
│   ├── bronze        # Raw standardized data
│   ├── silver        # Metadata-driven transformations
│   └── gold          # Facts, Dimensions & OBT
├── snapshots         # SCD Type 2 snapshots
├── macros            # Reusable metadata macros
├── tests             # Data quality tests
├── dbt_project.yml
└── README.md
```
## 🔄 Data Modeling Layers
🔹 Bronze Layer

Raw ingestion and standardization

Type casting and null handling

Controlled via metadata rules

🔹 Silver Layer

Business transformations

Entity-level models (hosts, listings, bookings)

Centralized transformation logic

🔹 Gold Layer

Fact tables for analytical measures

Dimension tables for descriptive attributes

One Big Table (OBT) for fast BI queries and self-service analytics

## 🧩 One Big Table (OBT)

The OBT denormalizes facts and dimensions into a single table to:

Reduce join complexity in BI tools

Improve query performance

Enable faster dashboard development

Support self-service analytics

## 🕒 Snapshots (SCD Type 2)

Snapshots track historical changes in dimension data.

Maintains current and historical records

Implements SCD Type 2 using dbt snapshot strategies

Enables auditing and trend analysis

## ▶️ How to Run the Project

This project uses Python 3.12, uv, and dbt.

## 1️⃣ Prerequisites

Python >= 3.12

uv (Python package manager)
```
```
## 2️⃣ Install Dependencies

Dependencies are defined in pyproject.toml:
```
[project]
name = "aws-dbt-snowflake"
version = "0.1.0"
description = "Airbnb end-to-end data engineering project"
readme = "README.md"
requires-python = ">=3.12"
dependencies = [
    "dbt-core>=1.11.2",
    "dbt-snowflake>=1.11.0",
]
```
Install them using:

uv sync

3️⃣ Configure dbt Profile

Create the file:

~/.dbt/profiles.yml


Configure Snowflake credentials as per your environment.

4️⃣ Run dbt
dbt deps
dbt run
dbt snapshot
dbt test

✅ Recommended (Single Command)
dbt build

🚀 Future Enhancements

Workflow orchestration using Airflow

CI/CD for dbt deployments

Automated metadata ingestion

BI dashboards (Power BI / Tableau)

👤 Author

Mohit Joshi
```

---

## 📚 References

This project was inspired by and takes reference from the following resources:

- YouTube: *Airbnb dbt & Snowflake Data Engineering Tutorial* — https://www.youtube.com/watch?v=3SZSDKEZqoA

```
