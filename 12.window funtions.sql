-- window funtions

select gender, sum(salary) over(partition by gender order by dem.employee_id) as salary
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

select dem.employee_id, dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;