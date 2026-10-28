# Bank Customer Churn Analysis

## Project Overview
This project analyzes customer churn in a bank to identify customer segments with higher churn rates and understand patterns that may help improve customer retention.

## Business Problem
Customer churn can reduce revenue and long-term customer value. This project explores customer data to identify patterns associated with churn.

## Tools Used
- MySQL — Data analysis using SQL queries
- Microsoft Power BI — Dashboard and data visualization

## Analysis Performed
- Overall customer churn rate
- Geography-wise churn analysis
- Active versus inactive customers
- Age group-wise churn
- Product-wise churn
- Credit card-wise churn
- Tenure-wise churn
- Balance-wise churn
- Salary-wise churn
- Gender-wise churn
- Credit score-wise churn

## Key Metrics
- Total Customers: 10,000
- Churned Customers: 2,037
- Churn Rate: 20.37%
- Retention Rate: 79.63%

## Project Files
- `Churn_Analysis.pbix` — Power BI dashboard
- `bank_customer_churn_analysis.sql` — SQL analysis queries

## Key Findings
- Germany had the highest customer churn rate among the three countries analyzed, at 32.44%.
- Customers aged 50–59 had the highest churn rate at 56.04%.
- Inactive customers had a higher churn rate (26.85%) than active customers (14.27%).
- Out of 10,000 customers, 2,037 had churned, resulting in an overall churn rate of 20.37%.
- These findings highlight customer segments that may need further investigation to improve customer retention.
  
## How to Use
1. Open the SQL script in MySQL Workbench.
2. Connect to a MySQL database containing the required tables and columns.
3. Execute the queries to reproduce the analysis.
4. Open the Power BI report in Power BI Desktop to explore the dashboard.

## Note
The SQL script requires the relevant customer and account tables to be available in the connected database.
