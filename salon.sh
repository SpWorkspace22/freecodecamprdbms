#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi
  
  echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED
  BOOK_SERVICE SERVICE_ID_SELECTED
}

BOOK_SERVICE() {
  # get service id if present in table
  AVAILABLE_SERVICES=$($PSQL "SELECT name from services where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $AVAILABLE_SERVICES ]]
  then 
    # send to main menu
    MAIN_MENU "\nI could not find that service. What would you like today?"
  else
    #get phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    #get customer id
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_ID ]]
    then
        #get customer name
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME

        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')") 
        CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
    else
      CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
    fi
    #get appointment id
    echo -e "\nWhat time would you like your$AVAILABLE_SERVICES, $CUSTOMER_NAME?"
    read SERVICE_TIME

    INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time)values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a $AVAILABLE_SERVICES at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

MAIN_MENU 