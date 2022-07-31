#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals)  FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2)  FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals)  FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals)  FROM games")"


echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) as number_of_games FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo  "$($PSQL "SELECT teams.name FROM games INNER JOIN teams ON games.winner_id = teams.team_id WHERE year = 2018 AND round = 'Final'")"


echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELect DISTINCT(teams.name) from games inner join teams on teams.team_id = games.winner_id or games.opponent_id = teams.team_id where round='Eighth-Final' and year = 2014")"

echo -e "\nList of unique winning team names in the whole data set:"
echo  "$($PSQL "SELECT DISTINCT(teams.name) FROM games inner join teams on games.winner_id = teams.team_id  ORDER BY 1")"

echo -e "\nYear and team name of all the champions:"
echo  "$($PSQL "SELECT year, teams.name FROM games inner join teams on games.winner_id = teams.team_id WHERE round = 'Final' ORDER BY 1") "


echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT DISTINCT(teams.name) FROM games inner join teams on games.winner_id = teams.team_id WHERE teams.name LIKE 'Co%' ORDER BY 1 ")"
