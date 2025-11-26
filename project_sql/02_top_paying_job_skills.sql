/*
    Q: What skills are the top paying for a data analyst jobs?
    - Use the top 10 highest- paying Data Analyst jobs from first Query
    - Add the specific skills required for these roles
    -Why? this is providing a detailed look at which high paying job demad certain skills,helping job seekers to understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        name as company_name,
        salary_year_avg
    From 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id -- Wanted to see the company name 
    Where 
        (job_title_short = 'Data Analyst' AND job_location = 'Anywhere') 
        AND salary_year_avg IS NOT NULL
        order by
            salary_year_avg DESC
        limit 10
    )
SELECT top_paying_jobs. *,skills 
From 
    top_paying_jobs

INNER JOIN skills_job_dim  ON top_paying_jobs.job_id= skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
    Key Insights:
    SQL + Python form the essential technical foundation for most data analyst roles.
    Visualization capability (Tableau, Power BI) is consistently required across postings.
    Cloud data platforms (Snowflake, Azure, AWS) are increasingly common, reflecting modern data infrastructure.
    Collaboration tools (Jira, Confluence, Git-based platforms) appear frequently, indicating expectations beyond pure technical analysis.
    Spreadsheet skills remain relevant despite increasing technical stack complexity.
*/