# E-Commerce ELT Data Pipeline & Analytics

An end-to-end e-commerce ELT project using **Google BigQuery, SQL, Tableau, and GitHub**.

## Project Overview

This project demonstrates an ELT workflow for transforming raw e-commerce sales data into analytics-ready datasets and business insights.

## Architecture

CSV Dataset  
↓  
BigQuery `raw_sales`  
↓  
SQL Data Cleaning & Transformation  
↓  
BigQuery `clean_sales`  
↓  
Analytics Views  
↓  
Tableau Dashboard

## Data Quality & Transformation

The raw dataset contains several data quality issues that are handled using SQL:

- Removed duplicate order IDs
- Standardized category values
- Trimmed inconsistent text values
- Replaced missing customer IDs and payment methods with `Unknown`
- Filtered invalid quantities
- Calculated `total_sales`
- Created analytics views for monthly, category, regional, and product-level analysis

## BigQuery Tables & Views

### Tables
- `raw_sales` — Raw uploaded CSV data
- `clean_sales` — Cleaned and transformed sales data

### Analytics Views
- `v_monthly_sales`
- `v_category_sales`
- `v_region_sales`
- `v_product_sales`

## Dashboard

The Tableau dashboard provides insights into:

- Total Revenue
- Total Orders
- Units Sold
- Average Order Value
- Monthly Revenue Trends
- Revenue by Category
- Revenue by Region
- Top Products by Revenue
- Revenue by Payment Method

### Tableau Public Demo

[View Interactive Tableau Dashboard](https://public.tableau.com/app/profile/marushika.kalyan/viz/E-CommerceSalesAnalyticsDashboard_17903634971390/Dashboard1?publish=yes)

## Tech Stack

- Google BigQuery
- SQL
- Tableau Public
- GitHub
- CSV

## Key Skills Demonstrated

- Data ingestion
- Data cleaning
- Data validation
- SQL transformations
- ELT pipeline design
- Analytical views
- Business intelligence
- Data visualization
