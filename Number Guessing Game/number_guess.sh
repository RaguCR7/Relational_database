#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

#FIND IF THE USERNAME EXIST ALREADY

FIND_PLAYER_BY_USERNAME=$($PSQL "SELECT username, games_played, best_game FROM player WHERE username='$USERNAME'")

#USERNAME FOUND
if [[ ! -z $FIND_PLAYER_BY_USERNAME ]]
then
  
  echo "$FIND_PLAYER_BY_USERNAME" |  while IFS='|' read USER_NAME  GAMES_PLAYED  BEST_GAME 
  do
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
#USERNAME NOT FOUND
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi


#GENERATE A RANDOM INTEGER BETWEEN 1 & 1000

SECRET_NUMBER=$(( RANDOM%1000 + 0 ))
#echo "**SECRET NUMBER: $SECRET_NUMBER"

#START THE GAME

echo "Guess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=0

while [[ $USER_INPUT != $SECRET_NUMBER ]]
do
  read USER_INPUT
  if [[ ! $USER_INPUT =~ [0-9]+ ]]
  then
    echo "That is not an integer, guess again:"
  elif (( USER_INPUT > SECRET_NUMBER ))
  then
    echo "It's lower than that, guess again:"
  elif (( USER_INPUT < SECRET_NUMBER ))
  then
    echo "It's higher than that, guess again:"
  fi
  NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
done

#GAME DONE

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

if [[ ! -z $FIND_PLAYER_BY_USERNAME ]]
then
  #UPDATE PLAYER TABLE 
  echo "$FIND_PLAYER_BY_USERNAME" |  while IFS='|' read USER_NAME  GAMES_PLAYED  BEST_GAME 
  do
    MIN_BEST_GAME=$(($NUMBER_OF_GUESSES<$BEST_GAME ? $NUMBER_OF_GUESSES : $BEST_GAME))
    UPDATE_PLAYER_BY_USERNAME=$($PSQL "UPDATE player SET games_played = games_played +1, best_game = $MIN_BEST_GAME WHERE username='$USERNAME'")
  done
else
   #INSERT NEW PLAYER 
  INSERT_NEW_PLAYER=$($PSQL "INSERT INTO  player(username, games_played, best_game) values('$USERNAME', 1, $NUMBER_OF_GUESSES)")
fi
