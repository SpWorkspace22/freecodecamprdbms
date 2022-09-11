#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ $1 ]]
then
  if ! [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENTS=$($PSQL "select atomic_number,atomic_mass,melting_point_celsius,boiling_point_celsius,symbol,name,type from properties join elements USING(atomic_number) join types USING(type_id) where elements.name like '$1%' order by atomic_number limit 1")
  else
  
    ELEMENTS=$($PSQL "select atomic_number,atomic_mass,melting_point_celsius,boiling_point_celsius,symbol,name,type from properties join elements USING(atomic_number) join types USING(type_id) where elements.atomic_number=$1")
  fi
  if [[ -z $ELEMENTS ]]
  then
    echo "I could not find that element in the database."
  else
    echo $ELEMENTS | while IFS=\| read ATOMIC_NUMBER ATOMIC_MASS MPC BPC SY NAME TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SY). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
    done
  fi
else
  echo "Please provide an element as an argument."
fi
