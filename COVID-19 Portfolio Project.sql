use portfolio1;

-- Explore all the tables
select *
from deaths;

select *
from vaccinated;


-- Data that we are gong to use in this project
select location, date, total_cases, new_cases, total_deaths, population
from deaths
where continent is not null
order by 1,2


-- Total cases vs total deaths
select location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 as 'Death Percentage'
from deaths
where continent is not null
order by 1,2


-- Total cases vs the country population
select location, date, total_cases, population, (total_cases/population) * 100 as 'Total cases percentage on population'
from deaths
where continent is not null
order by 1,2


-- Countries with highest infection rate compared to population
select location, population, MAX(total_cases) as 'Total Cases', (MAX(total_cases)/population)*100 as 'Infection percentage with population'
from deaths
where continent is not null
group by location, population
order by 4 desc


-- Countries with highest death count compared to population
select location, MAX(cast(total_deaths as int)) as 'Total deaths'
from deaths
where continent is not null
group by location
order by 2 desc


-- Continent with highest death count compared to population
select continent, MAX(cast(total_deaths as int)) as 'Total deaths'
from deaths
where continent is not null
group by continent
order by 2 desc


-- Continent with highest death percentage compared to population
select continent, MAX(cast(total_deaths as int)) as 'Total deaths'
from deaths
where continent is not null
group by continent
order by 2 desc 


-- Global Numbers
select location, max(total_cases) as 'Total Cases', max(total_deaths) as 'Total Deaths', (max(total_deaths)/max(total_cases))*100 as 'Death Percent of cases'
from deaths
where continent is not null
group by location
order by 4 desc

