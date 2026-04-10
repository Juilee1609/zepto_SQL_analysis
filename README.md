# Zepto E-commerce SQL Data Analysis
Data Analyst Project with end-to-end SQL Data Analysis of Zepto E-commerce Inventory data.

## 🔍 Overview
This is a complete, real-world data analysis project based on an e-commerce inventory dataset from [Zepto](https://www.zeptonow.com/) — one of India’s fastest-growing quick-commerce. This project simulates workflows, from raw data exploration to business-focused data analysis.
The goal is to simulate how actual data analysts in the e-commerce or retail industries work behind the scenes to use SQL to:

-  Set up a messy, real-world e-commerce inventory database

-  Perform EDA to explore product categories, availability, and pricing inconsistencies

-  Implement Data Cleaning to handle null values, remove invalid entries, and convert pricing from paise to rupees

-  Write business-driven SQL queries to derive insights around pricing, inventory, stock availability, revenue and more
  ## 📁 Dataset
  The dataset was sourced from [Kaggle](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv) .  Each row represents a unique SKU for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility.
## 🔧 Project Workflow
### 1. Database & Table Creation
We start by creating a SQL table with appropriate data types
### 2. Data Import
Loaded CSV using pgAdmin's import feature.
### 3. 🔍 Data Exploration
- Counted the total number of records in the dataset

- Checked for null values across all columns

- Identified distinct product categories available in the dataset
 ### 4. 🧹 Data Cleaning
- Identified and removed rows where MRP or discounted selling price was zero

- Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability
### 5. 📊 Business Insights
- Found top 10 best-value products based on discount percentage

- Identified high-MRP products that are currently out of stock

- Estimated potential revenue for each product category

- Filtered expensive products (MRP > ₹500) with minimal discount

- Ranked top 5 categories offering highest average discounts

- Calculated price per gram to identify value-for-money products

- Grouped products based on weight into Low, Medium, and Bulk categories

- Measured total inventory weight per product category

