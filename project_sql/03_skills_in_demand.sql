/*
    Q: what are the most in demand skills for data analysts?
    - Join job postings to inner join table 
    - identify the top 5 in demand skills for a data analyst
    */

SELECT
    skills,
    count(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
job_title_short = 'Data Analyst' AND
job_work_from_home = TRUE
GROUP BY
skills
ORDER BY 
demand_count DESC
LIMIT 5;
