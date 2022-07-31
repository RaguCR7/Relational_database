#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "TRUNCATE TABLE teams, games"

cat games.csv | while  IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != 'year' ]]
then

  #Find if winner team already inserted
  WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  #INSERT the new winner team
  if [[ -z $WINNER_TEAM_ID ]]
  then
    INSERT_WINNER_TEAM_RESULT="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
    
    if [[ $INSERT_WINNER_TEAM_RESULT = 'INSERT 0 1' ]]
    then
      WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  fi
  #Find if opponent team already inserted
  OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  #INSERT the new opponent team
  if [[ -z $OPPONENT_TEAM_ID ]]
  then
    INSERT_OPPONENT_TEAM_RESULT="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
    if [[ $INSERT_OPPONENT_TEAM_RESULT = 'INSERT 0 1' ]]
    then
      OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
  fi

 
  #INSERT GAME
  INSERT_GAME_RESULT="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)  VALUES($YEAR, '$ROUND',$WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"

fi

done
