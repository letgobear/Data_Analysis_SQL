-- Group By
select * from employee_demographics;

select gender 
from employee_demographics
group by gender;

select gender, avg(age), max(age)
from employee_demographics
group by gender;

select * from employee_salary;

select occupation, avg(salary), max(salary), count(salary)
from employee_salary
group by occupation;

select * 
from employee_demographics
order by gender, age;