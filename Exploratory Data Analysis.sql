-- Exploratory Data Analysis

select *
from layoffs_staging2;

-- Looking at Percentage to see how big these layoffs were
select max(total_laid_off),  max(percentage_laid_off)
from layoffs_staging2;

-- if we order by funcs_raised_millions we can see how big some of these companies were
-- บริษัทที่เลิกจ้าง 100% เรียงตามเงินระดมทุน
select *
from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc;

-- Companies with the most Total Layoffs
select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select min(`date`), max(`date`)
from layoffs_staging2;


-- this it total in the past 3 years or in the dataset
select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

select *
from layoffs_staging2;

select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;

-- บริษัทที่เลิกจ้างมากสุด (sum ของเปอร์เซ็นต์)
select company, avg(percentage_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

-- Rolling Total of Layoffs Per Month
select substring(`date`, 1,7) as `MONTH`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`, 1,7) is not null
group by `MONTH`
order by 1 asc;


-- TOUGHER QUERIES-----------
-- now use it in a CTE so we can query off of it
with Rolling_Total as 
(
select substring(`date`, 1,7) as `MONTH`, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`, 1,7) is not null
group by `MONTH`
order by 1 asc
)
select `MONTH`, total_off
, sum(total_off) over(order by `MONTH`) as Rolling_Total
from Rolling_Total;


select company, sum(percentage_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

-- แยกตามบริษัทและปี
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc;


with Company_year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off) 
from layoffs_staging2
group by company, year(`date`)
), Company_Year_Rank as
(select *, dense_rank() over (partition by years order by total_laid_off desc) as Ranking
from Company_year
where years is not null
)
select *
from Company_Year_Rank
where Ranking <= 5
;