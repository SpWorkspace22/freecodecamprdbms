#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USER_NAME

USER_AVAIL=$($PSQL "select usernames from users where usernames='$USER_NAME'")
GAMES_PLAYED=$($PSQL "select count(*) from users inner join games using(user_id) where usernames='$USER_NAME'")
BEST_GAME=$($PSQL "select MIN(no_of_guess) from users inner join games using(user_id) where usernames='$USER_NAME'")

if [[ -z $USER_AVAIL ]]
then
  INSERT_USER=$($PSQL "insert into users(usernames) values('$USER_NAME')")
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
else
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUMBER=$((1 + RANDOM % 1000 ))
echo $RANDOM_NUMBER
GUESS=1
echo "Guess the secret number between 1 and 1000:"

while read NUM 
do
  if ! [[ $NUM =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $NUM -eq $RANDOM_NUMBER ]]
    then
      break;
    else
      if [[ $NUM -gt $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      elif [[ $NUM -lt $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      fi
    fi
  fi
  GUESS=$(( $GUESS + 1 ))
done

if [[ $GUESS == 1 ]]
then
  echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
else
  echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
fi

USER_ID=$($PSQL "select user_id from users where usernames='$USER_NAME'")
INSERT_GAMES=$($PSQL "insert into games (no_of_guess,user_id) values($GUESS,$USER_ID)")