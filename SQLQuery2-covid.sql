select * from [dbo].[coviddeaths]

select * from [dbo].[covidvaccination]

Select dea.continent, dea. location, dea.date, dea.population, vac.new_vaccinations
from PortfolioProject..coviddeaths dea
join PortfolioProject..covidvaccination vac
on dea.location= vac.location
and dea. date= vac.date
where dea.continent is not null

--use of partition
Select dea.continent, dea. location, dea.date, dea.population, vac.new_vaccinations
, count(vac.new_vaccinations) over (partition by dea. location order by dea.location, dea. date) as Rollingpeoplevaccinated
from PortfolioProject..coviddeaths dea
join PortfolioProject..covidvaccination vac
on dea.location= vac.location
and dea. date= vac.date
where dea.continent is not null

--cte
with popvsvac (continent, location, date, population, new_vaccinations, Rollingpeoplevaccinated) 
as (
Select dea.continent, dea. location, dea.date, dea.population, vac.new_vaccinations
, count(vac.new_vaccinations) over (partition by dea. location order by dea.location, dea. date) as Rollingpeoplevaccinated
from PortfolioProject..coviddeaths dea
join PortfolioProject..covidvaccination vac
on dea.location= vac.location
and dea. date= vac.date
where dea.continent is not null
)
select *,  (Rollingpeoplevaccinated/population)*100
from popvsvac

--temp table