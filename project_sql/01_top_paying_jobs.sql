/*
Q: What are the top - paying data analyst jobs?
    - Identify the top 10 highest-paying Data Analyst roles that are available remotely.
    - Focuses on job postings with specified salaries (remove nulls).
    - Highlight the top-paying opportunities for Data Analysts, offering insights
*/
SELECT
    job_id,
    job_title,
    job_location,
    name as company_name,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
From 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id -- Wanted to see the company name 
Where 
    (job_title_short = 'Data Analyst' AND job_location = 'Anywhere') 
    AND salary_year_avg IS NOT NULL
    order by
        salary_year_avg DESC
    limit 10;
