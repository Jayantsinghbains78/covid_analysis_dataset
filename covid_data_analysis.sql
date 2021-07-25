SELECT *
FROM [Protfolio project covid ]..covid_vaccination$ 
order by 3,4

--SELECT *
--FROM [Protfolio project covid ]..covid_death$ 
--order by 3,4

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM [Protfolio project covid ]..covid_death$
order by 1,2

-- lookiing at total cases vs total deaths
-- show that the death ratio in india is 1.3%
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_ratio
FROM [Protfolio project covid ]..covid_death$
where location like '%india%'
order by 1,2

-- shows 2.26 % of indian population is infected by 21-07-2021
SELECT Location, date, total_cases, population, total_deaths, (total_cases/population)*100 as infected_percentage
FROM [Protfolio project covid ]..covid_death$
where location like '%india%'
order by 1,2

--looking at countires with highest infectio percentage
-- the country with the highest infection percentage was andorra
SELECT Location, MAX(total_cases) AS HIGHEST_INFECTION, population, MAX(total_cases/population)*100 as highest_infected_percentage
FROM [Protfolio project covid ]..covid_death$
group by location, population
order by highest_infected_percentage DESC
