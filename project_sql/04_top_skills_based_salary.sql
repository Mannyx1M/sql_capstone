/*
    Q: what are the top paying skills based on salary?
    - look at what is the average salary associated with each skill for data analyst positions. 
    - (b)focuses on roles with specified salaries, regardless of location.


*/
SELECT
    skills,
    round (AVG(salary_year_avg),2) As average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
job_title_short = 'Data Analyst' 
 AND
 salary_year_avg IS NOT NULL -- removing salries with not values answering the first part of b
AND
job_work_from_home = TRUE
GROUP BY
skills
ORDER BY 
    average_salary DESC 
limit 20;

/*
    : Breakdown of data     
    - The query calculates average salaries for each skill and ranks them, identifying the highest-paying skills for data analysts.
    - It filters out jobs without salary data to ensure the results reflect only roles with verified compensation.
    - It meets the purpose of showing how different skills influence salary levels, helping highlight the most financially valuable skills to learn.
*/