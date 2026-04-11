# Layoffs-Data-Analysis-using-MySQL
The dataset used in this project contains real-world layoff data, which often includes inconsistencies such as missing values, duplicates, and formatting issues. The primary objective was to transform raw, unstructured data into meaningful insights through systematic data cleaning and exploratory data analysis (EDA).


 Data Analysis Project using MySQL (Data Cleaning + EDA)
This project is based on the guided data analysis tutorial by Alex The Analyst, where I performed end-to-end data analysis using MySQL.

 Project Overview
In this project, I worked with a real-world dataset and applied SQL techniques to clean, transform, and analyze the data. The goal was to extract meaningful insights through structured querying and exploratory data analysis (EDA).


 Tools & Technologies

• MySQL

• SQL (Window Functions, CTEs, Joins)

• Data Cleaning Techniques

• Exploratory Data Analysis (EDA)



 Data Cleaning Steps

• Removed duplicate records 

• Handled null and missing values

• Standardized inconsistent data formats

• Removed unimportant column




Exploratory Data Analysis (EDA)



Company-Level Insights

• Identified companies with the highest total layoffs

• Calculated average layoff percentage per company

• Analyzed year-wise layoffs per company

• Ranked top companies by layoffs using DENSE_RANK()



Industry & Country Analysis

• Found industries with the highest layoffs

• Compared layoffs across different countries

• Identified geographical trends in workforce reductions



Time-Based Trends

• Analyzed layoffs by:

• Date

• Year

• Month

• Determined peak layoff periods

• Built a rolling total of layoffs over time using window functions




Layoff Severity Analysis

• Identified:

• Maximum layoffs in a single day

• Companies with 100% layoffs

• Compared layoffs with funding raised




SQL Concepts Used

• Aggregations (SUM, AVG, MAX)

• Grouping (GROUP BY)

• Window Functions (DENSE_RANK, SUM() OVER)

• Common Table Expressions (CTEs)

• Date functions (YEAR(), SUBSTRING())

• Filtering & Sorting




Insights

• Certain industries and countries were disproportionately affected

• Layoffs peaked during specific time periods

• Some companies experienced complete workforce layoffs (100%)

• Rolling trends revealed waves of layoffs rather than isolated events
