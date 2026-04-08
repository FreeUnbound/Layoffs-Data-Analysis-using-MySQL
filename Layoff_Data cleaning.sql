-- Data Cleaning

select *
from layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null values or blank values
-- 4. Remove Any Columns


-- copying data from raw table to staging table
create table layoffs_staging
like layoffs;

insert layoffs_staging
select *
from layoffs;

-- 1. Remove Duplicates

select *
from layoffs_staging;

select *,
row_number() 
over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging;

-- checking duplicates

with duplicate_cte as
(
select *,
row_number() 
over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging
)
select *
from duplicate_cte
where row_num > 1;

select *
from layoffs_staging
where company = 'Casper';

-- copying data from staging table to staging table 2 (adding column row_num)
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2;

insert into layoffs_staging2
select *,
row_number() 
over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging;

select *
from layoffs_staging2;


select *
from layoffs_staging2
where row_num > 1;

-- deleting duplicates

delete
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2;


-- 2. Standardize the Data

select 
company,
trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

select 
company
from layoffs_staging2;


select distinct
industry
from layoffs_staging2
order by 1;


select *
from layoffs_staging2
where industry like 'crypto%';

Update layoffs_staging2
set industry = 'Crypto'
where industry like 'crypto%'; 

select *
from layoffs_staging2
where industry like 'crypto%';

select distinct
industry
from layoffs_staging2;


select distinct
location
from layoffs_staging2
order by 1;

select distinct
country
from layoffs_staging2
order by 1;


select *
from layoffs_staging2
where country like 'United States%'
order by 1;

select distinct
country,
trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';

select distinct
 country
from layoffs_staging2
order by 1;

-- date column from text to date format 
select
`date`
from layoffs_staging2;

select
`date`,
str_to_date(`date`,'%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date`= str_to_date(`date`,'%m/%d/%Y') ;

select
`date`
from layoffs_staging2;


Alter table layoffs_staging2
modify column `date` Date;

select *
from layoffs_staging2;


-- 3. Null values or blank values

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select distinct industry
from layoffs_staging2;

select *
from layoffs_staging2
where industry is null
or industry = '';

-- populating blanks/nulls

select *
from layoffs_staging2
where company = 'Airbnb';

select *
from layoffs_staging2 as t1
join layoffs_staging2 as t2
on t1.company=t2.company
and t1.location=t2.location
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

select t1.industry, t2.industry
from layoffs_staging2 as t1
join layoffs_staging2 as t2
on t1.company=t2.company
and t1.location=t2.location
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoffs_staging2
set industry = null
where industry = '';

update layoffs_staging2 as t1
join layoffs_staging2 as t2
on t1.company=t2.company
set t1.industry = t2.industry
where t1.industry is null 
and t2.industry is not null;

select *
from layoffs_staging2
where company = 'Airbnb';

select *
from layoffs_staging2
where industry is null
or industry = '';

select *
from layoffs_staging2
where company like 'Bally%';

select *
from layoffs_staging2;

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

-- removing nulls that are not important

delete 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2;

-- 4. Remove Any Columns

alter table layoffs_staging2
drop column row_num;

select *
from layoffs_staging2;