#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\nWELCOME TO SALON CENTER\n"


SELECT_SERVICE(){
  if [[ $1 ]]
  then
    echo -e "$1"
  fi
  # get available services
  ALL_SERVICES=$($PSQL "SELECT * FROM services")

  # if no services
  if [[ -z $ALL_SERVICES ]]
  then
    SELECT_SERVICES "Sorry no services available now."
  else
    echo -e "\nHere are list of available services..."
    # display services in certain order
    echo "$ALL_SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done

    # ask for a service
    echo -e "\nWhich service would you like ?"
    read SERVICE_ID_SELECTED
    # if input is not a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      SELECT_SERVICE "\nPlease enter a valid service number."
    else
      SERVICE_ID_RESULT=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

      # check if service is provided
      if [[ -z $SERVICE_ID_RESULT ]]
      then
        SELECT_SERVICE "Please select from available services only."
      else
        #get customer info
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        # if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
          # get new customer name
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME

          # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
        fi

        # ask desired time
        echo -e "\nPlease enter your desired time"
        read SERVICE_TIME

        # get customer_id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      
        # insert appointment details
        INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

        # get service name
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

        # get all details
        # ALL_DETAILS=$($PSQL "SELECT s.name, a.time, c.name FROM services s INNER JOIN appointments a USING(service_id) INNER JOIN customers c USING(customer_id) WHERE c.customer_id=$CUSTOMER_ID")

        # send to main menu
        echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
      fi

      fi
      
    fi

}

EXIT(){
  echo -e "\nThank you for choosing our service !"
}

SELECT_SERVICE