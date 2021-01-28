-- This file contains my solutions to the SQL Zoo tutorial: https://sqlzoo.net/wiki/SQL_Tutorial
--   For redability, a link will be provided as heading, and after that, a single line with the number of the question
--   followed by the answer as SQL queries.

-- https://sqlzoo.net/wiki/SELECT_basics
-- 1.
SELECT population FROM world
  WHERE name = 'Germany'
-- 2.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
-- 3.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial
-- 1.
SELECT name, continent, population FROM world
-- 2.
SELECT name
  FROM world
 WHERE population > 200000000
-- 3.
SELECT name, gdp/population
  FROM world
 WHERE population > 200000000
-- 4.
SELECT name, population/1000000
  FROM world
 WHERE continent = 'South America'
-- 5.
SELECT name, population
  FROM world
 WHERE name = 'France'
  OR name = 'Germany'
  OR name = 'Italy'
-- 6.
SELECT name
  FROM world
 WHERE name LIKE '%United%'
-- 7.
SELECT name, population, area
  FROM world
 WHERE area > 3000000
  OR population > 250000000
-- 8.
SELECT name, population, area
  FROM world
 WHERE area > 3000000
  XOR population > 250000000
-- 9.
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
  FROM world
 WHERE continent = 'South America'
-- 10.
SELECT name, ROUND(gdp/population, -3)
  FROM world
 WHERE gdp >= 1000000000000
-- 11.
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)
-- 12.
SELECT name, capital
  FROM world
 WHERE LEFT(name,1) = LEFT(capital,1)
  AND name <> capital
-- 13.
SELECT name
  FROM world
 WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'

-- https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial
-- 1.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
-- 2.
SELECT winner
  FROM nobel
 WHERE yr = 1962
  AND subject = 'Literature'
-- 3.
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'
-- 4.
SELECT winner
  FROM nobel
 WHERE subject = 'Peace'
  AND yr >= 2000
-- 5.
SELECT *
  FROM nobel
 WHERE subject = 'Literature'
  AND yr >= 1980 AND yr <= 1989
-- 6.
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama' )
-- 7.
SELECT winner
  FROM nobel
 WHERE winner LIKE 'John%'
-- 8.
SELECT *
  FROM nobel
 WHERE (subject = 'Physics' AND yr = 1980)
  OR (subject = 'Chemistry' AND yr = 1984)
-- 9.
SELECT *
  FROM nobel
 WHERE yr = 1980
  AND subject <> 'Chemistry'
  AND subject <> 'Medicine'
-- 10.
SELECT *
  FROM nobel
 WHERE (subject = 'Medicine'
  AND yr < 1910)
  OR (subject = 'Literature'
  AND yr >= 2004)
-- 11.
SELECT *
  FROM nobel
 WHERE winner = 'PETER GRÜNBERG'
-- 12.
SELECT *
  FROM nobel
 WHERE winner = 'EUGENE O''NEILL '
-- 13.
SELECT winner, yr, subject
  FROM nobel
 WHERE winner LIKE 'Sir%'
  ORDER BY yr DESC, winner
-- 14.
SELECT winner, subject
  FROM nobel
 WHERE yr = 1984
  ORDER BY subject IN ('Chemistry','Physics'), subject, winner
