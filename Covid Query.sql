--------------- Covid Project ---------------
----------- *KPIs* --------------
------- 1.Total Cases and Total Deaths, 
------- 2.New Cases and New Deaths per Day,
------- 3.Total Tests and Tests per Million, 
------- 4. Total Vaccinations and Vaccination Rate,
------- 5.People Fully Vaccinated and Fully Vaccinated Rate, 
------- 6. Hospitalization Rate,
------- 7. Case Fatality Rate CFR,
------- 8. Positivity Rate, 
------- 9.Vaccination Rate and Fully Vaccinated Rate, 
------- 10.Human Development Index (HDI) and Life Expectancy





use covid_data;
select * from covid_table;
select count(*) 
from covid_table;

---- Slide-1.
--------- Q-1.Total Cases and Total Deaths

SELECT
    location,
    MAX(date) AS latest_date,
    MAX(total_cases) AS total_cases,
    MAX(total_deaths) AS total_deaths
FROM
    covid_table
GROUP BY
    location;
    
    ----- Slide- 2.
    -------------- Q-2. New Cases and New Deaths per Day
    SELECT
    location,
    date,
    new_cases,
    new_deaths
FROM
    covid_table
ORDER BY
    location, date;
    
    
    ----- Slide-3.
    --------- Q-3.Total Tests and Tests per Million
    SELECT
    location,
    MAX(date) AS latest_date,
    SUM(total_tests) AS total_tests,
    SUM(total_tests) / (MAX(population) / 1000000) AS tests_per_million
FROM
    covid_table
GROUP BY
    location;
    
    ----- Slide-4.
    ----------- Q-4. Total Vaccinations and Vaccination Rate
  SELECT
    location,
    MAX(date) AS latest_date,
    MAX(total_vaccinations) AS total_vaccinations,
    (MAX(total_vaccinations) / MAX(population)) * 100 AS vaccination_rate
FROM
    covid_table
GROUP BY
    location;
    
    
    ----- Slide-5.
    --------- Q-5.People Fully Vaccinated and Fully Vaccinated Rate
   SELECT
    location,
    MAX(date) AS latest_date,
    MAX(people_fully_vaccinated) AS people_fully_vaccinated,
    (MAX(people_fully_vaccinated) / MAX(population)) * 100 AS fully_vaccinated_rate
FROM
    covid_table
GROUP BY
    location;
    
    
    ----- Slide-6.
    ------------- Q-6.Hospitalization Rate

    SELECT
    location,
    MAX(date) AS latest_date,
    (MAX(hosp_patients) / MAX(population)) * 100 AS hospitalization_rate
FROM
    covid_table
GROUP BY
    location;
    
    
    ----- Slide-7.
    ---------- Q-7. Case Fatality Rate CFR
    
    SELECT
    location,
    MAX(date) AS latest_date,
    (MAX(total_deaths) / MAX(total_cases)) * 100 AS case_fatality_rate
FROM
    covid_table
GROUP BY
    location;
    
    
    ----- Slide-8.
    ---------- Q-8. Positivity Rate
    
    SELECT
    location,
    MAX(date) AS latest_date,
    MAX(total_cases) AS total_cases,
    MAX(total_tests) AS total_tests,
    (MAX(total_cases) / MAX(total_tests)) * 100 AS estimated_positivity_rate
FROM
    covid_table
GROUP BY
location;


----- Slide-9.
-------- Q-9.Vaccination Rate and Fully Vaccinated Rate


SELECT
    location,
    MAX(date) AS latest_date,
    SUM(total_vaccinations) / MAX(population) AS vaccination_rate,
    SUM(people_fully_vaccinated) / MAX(population) AS fully_vaccinated_rate
FROM
    covid_table
GROUP BY
    location;
    
    
    ----- Slide-10.
    -------------- Q-10. Human Development Index (HDI) and Life Expectancy
    
   SELECT
    location,
    MAX(date) AS latest_date,
    MAX(human_development_index) AS hdi,
    MAX(life_expectancy) AS life_expectancy
FROM
    covid_table
GROUP BY
    location;
    
    --------------- End ---------------------------------