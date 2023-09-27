#!/bin/bash
#Guy Reuveni 206398596

pointsP1=50
pointsP2=50
ball=0

# this function takes one argument and checks if it contains a number.
numberValidation() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    if [[ $1 -ge 0 ]]; then
      if [[ $2 == 1 && $1 -gt $pointsP1 ]] || [[ $2 == 2 && $1 -gt $pointsP2 ]]; then
        echo "NOT A VALID MOVE !"
        return 1 # Return failure code
      fi
      return 0 # Return success code
    else
      echo "NOT A VALID MOVE !"
      return 1 # Return failure code
    fi
  else
    echo "NOT A VALID MOVE !"
    return 1 # Return failure code
  fi
}

# this function prints the current state of the game board.
board() {
  echo " Player 1: $1         Player 2: $2 "
  echo " --------------------------------- "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "

  case $3 in
  -1)
    echo " |       |   O   #       |       | "
    ;;
  -2)
    echo " |   O   |       #       |       | "
    ;;
  -3)
    echo "O|       |       #       |       | "
    ;;
  0)
    echo " |       |       O       |       | "
    ;;
  1)
    echo " |       |       #   O   |       | "
    ;;
  2)
    echo " |       |       #       |   O   | "
    ;;
  3)
    echo " |       |       #       |       |O"
    ;;
  esac

  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " --------------------------------- "
}

# this function determines the outcome of a round in the game based on the numbers picked by the
# two players and updates the game state accordingly.
theJudgeCheck() {
  if (($1 == $2)); then
    judgeMove $1 $2
    return
  fi
  if (($1 > $2)); then
    if (($ball < 0)); then
      ball=1
    else
      ball=$((ball + 1))
    fi
  else
    if (($ball > 0)); then
      ball=-1
    else
      ball=$((ball - 1))
    fi
  fi
  judgeMove "$1" "$2"
  judgeAnnouncement
}

# this function updates the game state based on the numbers picked by the two players and displays the
# current state of the game board using the `board()` function. It takes two arguments, `pointsP1` and `pointsP2`, which
# represent the current scores of the two players, and `ball`, which represents the position of the ball on the board.
judgeMove() {
  pointsP1=$(($pointsP1 - $1))
  pointsP2=$(($pointsP2 - $2))
  board $pointsP1 $pointsP2 $ball
  echo -e "       Player 1 played: ${1}\n       Player 2 played: ${2}\n\n"
  judgeAnnouncement
}
# this function checks the current state of the game and announces the winner or a draw.
judgeAnnouncement() {
  if (($pointsP1 == 0)) && (($pointsP2 == 0)); then
    if (($ball == 0)); then
      echo "IT'S A DRAW !"
      exit 0
    fi
    if (($ball > 0)); then
      echo "PLAYER 1 WINS !"
      exit 0
    fi
    if (($ball < 0)); then
      echo "PLAYER 2 WINS !"
      exit 0
    fi
  fi
  if (($ball == -3)); then
    echo "PLAYER 2 WINS !"
    exit 0
  fi
  if (($ball == 3)); then
    echo "PLAYER 1 WINS !"
    exit 0
  fi
  if (($pointsP2 == 0)) && (($pointsP1 > 0)); then
    echo "PLAYER 1 WINS !"
    exit 0
  fi
  if (($pointsP1 == 0)) && (($pointsP2 > 0)); then
    echo "PLAYER 2 WINS !"
    exit 0
  fi
}

# this function runs the game loop. It first calls the `board()` function to display the current state
# of the game board. Then, it enters a `while` loop that continues indefinitely until the game is over. Within the loop,
# it prompts the first player to pick a number and validates their input using the `numberValidation()` function. It then
# prompts the second player to pick a number and validates their input as well. Finally, it calls the `theJudgeCheck()`
# function with the two numbers picked by the players as arguments to determine the outcome of the round and update the
# game state accordingly. The loop then repeats, prompting the players to pick new numbers and continuing until the game
# is over
playGame() {
  board $pointsP1 $pointsP2 $ball
  while true; do
    p1Identifer=1
    p2Identifer=2
   echo "PLAYER 1 PICK A NUMBER: "
    read -s pickOne
    #check if the user one input is valid, and if not, it will print a message
    while ! numberValidation "$pickOne" "$p1Identifer"; do
      echo "PLAYER 1 PICK A NUMBER: "
      read -s pickOne
    done
    echo "PLAYER 2 PICK A NUMBER: "
    read -s pickTwo
    while ! numberValidation "$pickTwo" "$p2Identifer"; do
       #check if the user two input is valid, and if not, it will print a message
       echo "PLAYER 2 PICK A NUMBER: "
       read -s pickTwo
    done
    theJudgeCheck "$pickOne" "$pickTwo"
  done
}

playGame
