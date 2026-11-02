-- limit & aliasing
-- note => desc คือ มากไปน้อย
select *
from employee_demographics
order by age desc
limit 2, 1
;

-- Aliasing (as)
select gender, avg(age) as avg_age
from employee_demographics
group by gender
having avg_age > 40
;