
-- =========================================
-- BANK CUSTOMER CHURN ANALYSIS
-- Section 1: Overall Churn Analysis
-- =========================================

SELECT
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        SUM(Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM bank_churn_account_info;


-- =========================================
-- Section 2: Geography-wise Churn Analysis
-- =========================================

SELECT
    c.Geography,
    COUNT(*) AS total_customers,
    SUM(a.Exited) AS churned_customers,
    ROUND(
        SUM(a.Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM bank_churn_customer_info AS c
JOIN bank_churn_account_info AS a
    ON c.CustomerId = a.CustomerId
GROUP BY c.Geography
ORDER BY churn_rate_percentage DESC;


-- =========================================
-- Section 3: Active vs Inactive Customers
-- =========================================

SELECT
    IsActiveMember,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        SUM(Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM bank_churn_account_info
GROUP BY IsActiveMember
ORDER BY churn_rate_percentage DESC;


-- =========================================
-- Section 4: Age Group-wise Churn Analysis
-- =========================================

SELECT
    CASE
        WHEN c.Age < 30 THEN 'Under 30'
        WHEN c.Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN c.Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN c.Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(a.Exited) AS churned_customers,
    ROUND(
        SUM(a.Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM bank_churn_customer_info AS c
JOIN bank_churn_account_info AS a
    ON c.CustomerId = a.CustomerId
GROUP BY age_group
ORDER BY churn_rate_percentage DESC;


-- =========================================
-- Section 5: Product-wise Churn Analysis
-- =========================================

SELECT
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        SUM(Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM bank_churn_account_info
GROUP BY NumOfProducts
ORDER BY NumOfProducts;


-- =========================================
-- Section 6: Credit Card-wise Churn Analysis
-- =========================================

SELECT
    HasCrCard,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        SUM(Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM bank_churn_account_info
GROUP BY HasCrCard
ORDER BY churn_rate_percentage DESC;


-- =========================================
-- Section 7: Tenure-wise Churn Analysis
-- =========================================

SELECT
    Tenure,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        SUM(Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM bank_churn_account_info
GROUP BY Tenure
ORDER BY Tenure;


-- =========================================
-- Section 8: Balance-wise Churn Analysis
-- =========================================

SELECT
    CASE
        WHEN Clean_balance = 0 THEN '0'
        WHEN Clean_balance <= 50000 THEN '1-50000'
        WHEN Clean_balance <= 100000 THEN '50001-100000'
        WHEN Clean_balance <= 150000 THEN '100001-150000'
        ELSE 'Above 150000'
    END AS balance_group,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(
        SUM(Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM bank_churn_account_info
GROUP BY balance_group
ORDER BY
    CASE balance_group
        WHEN '0' THEN 1
        WHEN '1-50000' THEN 2
        WHEN '50001-100000' THEN 3
        WHEN '100001-150000' THEN 4
        ELSE 5
    END;


-- =========================================
-- Section 9: Salary-wise Churn Analysis
-- =========================================

SELECT
    CASE
        WHEN c.EstimatedSalary_clean <= 50000 THEN '0-50000'
        WHEN c.EstimatedSalary_clean <= 100000 THEN '50001-100000'
        WHEN c.EstimatedSalary_clean <= 150000 THEN '100001-150000'
        ELSE 'Above 150000'
    END AS salary_group,
    COUNT(*) AS total_customers,
    SUM(a.Exited) AS churned_customers,
    ROUND(
        SUM(a.Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM bank_churn_customer_info AS c
JOIN bank_churn_account_info AS a
    ON c.CustomerId = a.CustomerId
GROUP BY salary_group
ORDER BY
    CASE salary_group
        WHEN '0-50000' THEN 1
        WHEN '50001-100000' THEN 2
        WHEN '100001-150000' THEN 3
        ELSE 4
    END;


-- =========================================
-- Section 10: Gender-wise Churn Analysis
-- =========================================

SELECT
    c.Gender,
    COUNT(*) AS total_customers,
    SUM(a.Exited) AS churned_customers,
    ROUND(
        SUM(a.Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM bank_churn_customer_info AS c
JOIN bank_churn_account_info AS a
    ON c.CustomerId = a.CustomerId
GROUP BY c.Gender
ORDER BY churn_rate_percentage DESC;


-- =========================================
-- Section 11: Credit Score-wise Churn Analysis
-- =========================================

SELECT
    CASE
        WHEN c.CreditScore < 500 THEN 'Below 500'
        WHEN c.CreditScore < 600 THEN '500-599'
        WHEN c.CreditScore < 700 THEN '600-699'
        WHEN c.CreditScore < 800 THEN '700-799'
        ELSE '800+'
    END AS credit_score_group,
    COUNT(*) AS total_customers,
    SUM(a.Exited) AS churned_customers,
    ROUND(
        SUM(a.Exited) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM bank_churn_customer_info AS c
JOIN bank_churn_account_info AS a
    ON c.CustomerId = a.CustomerId
GROUP BY credit_score_group
ORDER BY
    CASE credit_score_group
        WHEN 'Below 500' THEN 1
        WHEN '500-599' THEN 2
        WHEN '600-699' THEN 3
        WHEN '700-799' THEN 4
        ELSE 5
    END;
