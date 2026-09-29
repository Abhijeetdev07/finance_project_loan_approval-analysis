create database bank_loan;

use bank_loan;

select * from loan_approved_clean;

select count(*) from loan_approved_clean;

alter table loan_approved_clean rename to l_approved;

select * from l_approved;
select count(*) from l_approved;

alter table l_approved drop column MyUnknownColumn;

-- 1. Overall Performance (Dashboard Overview)
-- • What is the total number of loan applications?
select count(*) from l_approved;

-- • How many applications were approved vs rejected?
SELECT Loan_Status, COUNT(*) loan_status_count FROM l_approved GROUP BY Loan_Status;

-- • What is the average loan amount issued?
select round(avg(loanamount),2) from l_approved where Loan_Status = 'Y';

-- • What is the average applicant income?
select round(avg(Applicantincome+coapplicantincome),2) avg_app_income from l_approved;

-- • What is the overall loan approval rate?



-- SECTION 1 — Basic SQL Queries
-- 1. View the first 10 records from the table.
select * from l_approved limit 10;

-- 2. Count the total number of loan applications.
select count(*) from l_approved;

-- 3. List all unique property areas.
select distinct(property_area) from l_approved;

-- 4. Show all applicants who are self-employed and have an income above 5000.
select * from l_approved where self_employed = 'Yes' and applicantincome > 5000;

-- 5. Find the total number of approved loans.
select count(*) from l_approved where loan_status = 'Y';

-- =========================================================================================


-- SECTION 2 — Aggregation & Grouping
-- 6. Find average loan amount by education level.
select education, round(avg(loanamount),2) from l_approved group by education;

-- 7. Find average total income (Applicant + Coapplicant) by marital status.
select married, round(avg(Applicantincome+coapplicantincome),2) as total_income from l_approved group by married;

-- 8. Show average loan amount by credit history.
select credit_history, round(avg(loanamount),2) from l_approved group by credit_history;

-- 9. Find total applications and approval rate by gender.
  select gender, count(*),
  sum(case when loan_status = 'Y' then 1 else 0 end) as approval,
  sum(case when loan_status = 'Y' then 1 else 0 end)/count(*)*100 as approval_status
  from l_approved group by gender;

-- 10. Show approval rate by property area.

  select property_area, count(*),
  sum(case when loan_status = 'Y' then 1 else 0 end) as approval,
  sum(case when loan_status = 'Y' then 1 else 0 end)/count(*)*100 as approval_status
  from l_approved group by property_area;

-- ===================================================================================================== 

-- SECTION 3 — Filtering & Conditions
-- 11. Show applicants who are graduates, not self-employed, and have loan amount greater
-- than 150.
select * from l_approved where education = 'graduate'and self_employed = 'No' and loanamount > 150;

-- 12. Display approved loans from urban area with good credit history.
select * from l_approved where property_area = 'urban' and credit_history = 1;

-- 13. List top 5 applicants with highest total income.
select * from l_approved order by (Applicantincome+coapplicantincome) desc limit 5;


-- =======================================================================================================
-- SECTION 4 — Derived Columns & CASE WHEN

-- 14. Create derived columns for total income for each applicant.


-- 15. Classify applicants into income groups (Low, Medium, High) based on applicant income.
SELECT 
 loan_id,applicantincome,
    CASE
        WHEN ApplicantIncome < 3000 THEN 'Low'
        WHEN ApplicantIncome BETWEEN 3000 AND 5000 THEN 'Medium'
        ELSE 'High'
    END AS Income_Group
FROM l_approved;


-- 16. Find average loan amount for each income group.
select CASE
        WHEN ApplicantIncome < 3000 THEN 'Low'
        WHEN ApplicantIncome BETWEEN 3000 AND 5000 THEN 'Medium'
        ELSE 'High'
    END AS Income_Group, round(avg(loanamount),2) as avg_loanamount from l_approved group by income_group;
    
    -- ===========================================================================================================

-- SECTION - 5 — Subqueries & Nested Analysis

-- 17. Find applicants whose loan amount is greater than the overall average loan amount.
select * from l_approved where loanamount > (select avg(loanamount) from l_approved);

-- 18. Identify the property area with the highest average total income.


-- 19. List all applicants whose income is above the average income of their education category.


-- 23. Compare approval rate by credit history and education level to find which combination
-- performs best.

-- 24. Find the combination of property area and education with the highest approval rate.


-- 25. Compare approval rate for self-employed vs non-self-employed applicants by credit
-- history.
select Self_Employed,
       Credit_History, 
	   count(*) as total_applicants, 
       sum(case when loan_status = 'Y' then 1 else 0 end) as approvals,
	   round(sum(case when loan_status = 'Y' then 1 else 0 end)/count(*)*100, 2) as approval_rate
from l_approved group by Self_Employed, Credit_History
order by approval_rate desc;

