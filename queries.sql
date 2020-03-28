-- Total Cases --
SELECT
       count(1) FILTER (
                        WHERE is_confirmed=true) as "Total Confirmed",
       count(1) FILTER (
                        WHERE is_dead=true) as "Total Died",
       count(1) FILTER (
                        WHERE is_recovered=true) as "Total Recovered"
FROM cases
WHERE country = 'Pakistan'; 

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