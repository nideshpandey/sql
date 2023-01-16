#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")
cat games.csv | while IFS="," read Y R WINNER OPPONENT WG OG
do
  if [[  $WINNER != 'winner' && $OPPONENT != 'opponent' ]]
  then
    # get team_id
    W_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    O_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # if_winner_not_found
    if [[ -z $W_TEAM_ID ]]
    then
      INSERT_WINNER_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi
    if [[  $INSERT_WINNER_NAME == 'INSERT 0 1' ]]
    then
      echo "Inserted team: $WINNER"
    fi
    # if_opponent_not_found
    if [[ -z $O_TEAM_ID ]]
    then
      INSERT_OPPONENT_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    fi
    if [[  $INSERT_OPPONENT_NAME == 'INSERT 0 1' ]]
    then
      echo "Inserted team: $OPPONENT"
    fi
  fi
done

cat games.csv | while IFS="," read Y R WINNER OPPONENT WG OG
do
  if [[  $WINNER != 'winner' && $OPPONENT != 'opponent' ]]
  then
    W_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    O_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ -n $W_TEAM_ID && $O_TEAM_ID ]]
    then
      GAME_INFO=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($Y,'$R',$W_TEAM_ID,$O_TEAM_ID,$WG,$OG)")
    fi
    if [[ $GAME_INFO == 'INSERT 0 1' ]]
    then
      echo "Inserted game"
    fi
  fi
done



