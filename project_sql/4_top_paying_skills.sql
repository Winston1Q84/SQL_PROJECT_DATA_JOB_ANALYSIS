SELECT
    skills,
    round(avg(salary_year_avg)) average_salary 
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Business Analyst' AND 
    salary_year_avg IS NOT NULL
GROUP BY
    skills 
ORDER BY 
    skills DESC
LIMIT 100