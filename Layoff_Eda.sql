-- EDA

select * 
from layoffs_staging2;

-- max layoff in one day
select max(total_laid_off)
from layoffs_staging2;

-- max layoff percentage in one day (1 = 100%)
select max(total_laid_off),Max(percentage_laid_off)
from layoffs_staging2;

select * 
from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc;

-- company with highest layoff
select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 Desc;

select min(`date`),max(`date`)
from layoffs_staging2;

-- industry with highest layoff
select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

-- country with highest layoff
select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

-- date with highest layoff
select `date`, sum(total_laid_off)
from layoffs_staging2
group by `date`
order by 2 desc;

-- year with highest layoff
select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;

-- stage with highest layoff
select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 1 desc;

-- company with avg layoff percentage
select company, avg(percentage_laid_off)
from layoffs_staging2
group by company
order by 2 Desc;

select * 
from layoffs_staging2;

-- rolling total by month
select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc;

with rolling_total as
(
select substring(`date`,1,7) as `month`, sum(total_laid_off)as total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc
)
select `month`,
total_off,
 sum(total_off) 
over(order by `month`) as rolling_total
from rolling_total;

-- company with multiple layoff
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by company asc;

select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc;

-- rank
with company_year(company,years,total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
)
select *,dense_rank() over(partition by years order by total_laid_off Desc) as ranking
from company_year
where years is not null;


with company_year(company,years,total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
),
company_year_rank as
(
select *,dense_rank() over(partition by years order by total_laid_off Desc) as ranking
from company_year
where years is not null
)
select * 
from company_year_rank
where ranking <= 5;