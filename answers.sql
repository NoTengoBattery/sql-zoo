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

-- https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial
-- 1.
SELECT name FROM world
  WHERE population >
   (SELECT population FROM world
   WHERE name='Russia')
-- 2.
SELECT name
  FROM world
 WHERE (gdp/population) >
  (SELECT gdp/population FROM world WHERE name = 'United Kingdom')
  AND continent = 'Europe'
-- 3.
SELECT name, continent FROM world
 WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
 ORDER BY name
-- 4.
SELECT name, population FROM world
 WHERE population = (SELECT population FROM world WHERE name = 'Canada')
  AND population = (SELECT population FROM world WHERE name = 'Poland')
-- 5.
SELECT name, CONCAT(ROUND(population*100/(SELECT population FROM world WHERE name = 'Germany'),0), '%') AS percentage FROM world
 WHERE continent = 'Europe'
-- 6.
SELECT name FROM world
 WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp >= 0)
-- 7.
SELECT continent, name, area FROM world x
 WHERE area >= ALL
  (SELECT area FROM world y
   WHERE y.continent=x.continent
   AND area>0)
-- 8.
SELECT a.continent, a.name FROM world a
 WHERE a.name <= ALL (SELECT b.name FROM world b WHERE a.continent = b.continent)
-- 9.
SELECT a.name, a.continent, a.population FROM world a
 WHERE 25000000 > ALL (SELECT b.population FROM world b WHERE a.continent = b.continent)
-- 10.
SELECT a.name, a.continent FROM world a
 WHERE a.population/3 >= ALL (SELECT b.population FROM world b WHERE a.continent = b.continent AND a.name <> b.name)

-- https://sqlzoo.net/wiki/SUM_and_COUNT
-- 1.
SELECT SUM(population) FROM world
-- 2.
SELECT DISTINCT continent FROM world
-- 3.
SELECT SUM(gdp) FROM world WHERE continent = 'Africa'
-- 4.
SELECT COUNT(area) FROM world WHERE area >= 1000000
-- 5.
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
-- 6.
SELECT continent, COUNT(name) FROM world
 GROUP BY continent
-- 7.
SELECT continent, COUNT(population) FROM world
 WHERE population >= 10000000
 GROUP BY continent
-- 8.
SELECT continent FROM world
 GROUP BY continent
 HAVING SUM(population) >= 100000000

-- https://sqlzoo.net/wiki/The_JOIN_operation
-- 1.
SELECT matchid, player FROM goal
 WHERE teamid = 'GER'
-- 2.
SELECT id, stadium, team1, team2
  FROM game
 WHERE id = 1012
-- 3.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id = matchid) WHERE teamid = 'GER'
-- 4.
SELECT team1, team2, player
  FROM game JOIN goal ON (id = matchid) WHERE player LIKE 'Mario%'
-- 5.
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id
 WHERE gtime<=10
-- 6.
SELECT mdate, teamname
  FROM game JOIN eteam ON team1 = eteam.id
 WHERE eteam.coach = 'Fernando Santos'
-- 7.
SELECT player
  FROM goal JOIN game ON matchid = id
 WHERE stadium = 'National Stadium, Warsaw'
-- 8.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id
 WHERE (team1='GER' OR team2='GER') AND teamid <> 'GER'
-- 9.
SELECT teamname, COUNT(gtime)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
-- 10.
SELECT stadium, COUNT(gtime)
  FROM game JOIN goal ON id=matchid
 GROUP BY stadium
-- 11.
SELECT matchid, mdate, COUNT(gtime)
  FROM goal JOIN game ON matchid = id
 WHERE (team1 = 'POL' OR team2 = 'POL')
 GROUP BY matchid, mdate
-- 12.
SELECT matchid, mdate, COUNT(gtime)
  FROM game JOIN goal ON id = matchid
  WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER'
 GROUP BY matchid, mdate
-- 13.
SELECT mdate, team1,
  SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
  FROM game JOIN goal ON id = matchid
 GROUP BY mdate, team1, team2
 ORDER BY mdate, matchid, team1, team2
