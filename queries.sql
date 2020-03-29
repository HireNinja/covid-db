-- Total Cases --
SELECT
       count(1) FILTER (
                        WHERE is_confirmed=true) as "Total Confirmed",
       count(1) FILTER (
                        WHERE is_dead=true) as "Total Died",
       count(1) FILTER (
                        WHERE is_recovered=true) as "Total Recovered"
FROM cases

-- Confirmed cases in a country --
SELECT
    confirmed_at::date,
    count(1) FILTER (WHERE is_confirmed=true) as "Total Confirmed", 
    count(1) FILTER (WHERE is_dead=true) as "Total Died",
    count(1) FILTER (WHERE is_recovered=true) as "Total Recovered"
FROM 
    cases 
WHERE 
    country = 'Pakistan'
GROUP BY 
    confirmed_at
ORDER BY 
    confirmed_at; 


--- 
SELECT confirmed_at::date as "entry_date", 
       count(*) as "total_confirmed"
FROM 
    cases
WHERE 
    is_confirmed = true and
    location_uuid IN ('b3f1299d-c3cb-4ef5-bc0b-5d90acfd7cd0', 'fb2f196d-dcf4-43d7-b3a0-ba4cbdb0b854', 'ce1f4505-057e-4cd5-9abe-1da3ed59b96b')
group by 
    confirmed_at
order BY    
    confirmed_at desc;


select sum(new_confirmed) as total_confirmed, sum(new_deaths) as total_deaths, sum(new_recovered) as total_recovered 
from tracker
where entry_date <= '2020-02-26' and
    location_uuid IN ('b3f1299d-c3cb-4ef5-bc0b-5d90acfd7cd0',
                  'fb2f196d-dcf4-43d7-b3a0-ba4cbdb0b854',
                  'ce1f4505-057e-4cd5-9abe-1da3ed59b96b');
