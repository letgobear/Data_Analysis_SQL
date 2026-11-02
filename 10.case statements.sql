-- case statements

select first_name,
last_name,
age,
case
	when age <= 30 then 'YOUNG'
    when age between 31 and 50 then 'OLD'
    when age >= 50 then "ON Death's Door"
end as Age_statements
from employee_demographics
;


-- pay increase and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

select first_name, last_name, salary,
case 
	when salary < 50000 then salary * 1.05
    when salary > 50000 then salary * 1.07
end as New_saraly,
case 
	when dept_id = 6 then salary * .10
end as Bonus
from employee_salary
;

select *
from employee_salary;
select *
from parks_departments
;