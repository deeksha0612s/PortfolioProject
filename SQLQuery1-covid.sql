select * 
from [PortfolioProject]..coviddeaths
order by 3,4

select * 
from [PortfolioProject]..covidvaccination
order by 3,4

--select data that we are going to use
select location, date,total_cases, new_cases, total_deaths, population
from [PortfolioProject]..coviddeaths
order by 1,2

--Looking at total_cases vs total_cases 
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
from PortfolioProject..coviddeaths
where location like '%states'
order by 1,2

--Looking at total_cases VS population
Select location, date, population, total_cases, (Total_cases/population)*100 AS Death_percentage
From PortfolioProject..coviddeaths
Where location like '%states'
order by 1,2

--Looking at countries With highest infection rate compared to population
Select location, population, MAX(total_cases) AS Highest_Infection, MAX((Total_cases/population)*100) AS infected_percentage
From PortfolioProject..coviddeaths
Group by location, population
order by infected_percentage DESC

--Looking for countries with highest death count per population
select location, MAX(total_deaths) AS Total_deaths_count
From PortfolioProject..coviddeaths
Group by location
ORDER by Total_deaths_count DESC

--Looking for continent with highest death count per population
select continent, MAX(total_deaths) AS Total_deaths_count
From PortfolioProject..coviddeaths
where continent is not null
Group by continent
ORDER by Total_deaths_count DESC

--Global Number
select date, sum(new_cases) as total_new_cases, sum(new_deaths) as total_new_deaths
From PortfolioProject..coviddeaths
where continent is not null
Group by date


