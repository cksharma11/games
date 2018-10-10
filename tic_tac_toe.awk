#! /usr/bin/awk -f

function validate_move(move,moves_array){
  value= int(move)
  if((int(move)>0 && int(move)<10) && ((moves_array[value] !="x") && (moves_array[value]!="o"))){
    return 1;
  }
  print "Invalid move."
  return 0;
}

function game_status(moves_array,turn){
    for(i=1;i<4;i++){
      if((moves_array[i]==moves_array[i+3]) && (moves_array[i]==moves_array[i+6])){
        if(moves_array[i]=="x"){
             print player1" WON!"
             exit
            }
             print player2" WON"
             exit 
         }
    }
    if((moves_array[i]==moves_array[i+1]) && (moves_array[i]==moves_array[i+2])){
        if(moves_array[i]=="x"){
            print player1" WON!"
            exit
            }
            print player2" WON"
            exit
      }   
    if(((moves_array[1]==moves_array[5]) && (moves_array[1]==moves_array[9])) || (moves_array[3]==moves_array[5]) && (moves_array[3]==moves_array[7])){
      if(moves_array[5]=="x"){
        print player1" WON!"
        exit
      }
      print player2" WON"
      exit
    }
    if(turn>=9){
      print "--Draw--"
      exit;  
    }

  }
  BEGIN{
    result=0
    turn=0
    moves="1 2 3 4 5 6 7 8 9"
    split(moves,moves_array," ")
    print "  \n You can choose from 1 to 9 to play the game :"
    print "_1_|_2_|_3_\n_4_|_5_|_6_\n 7 | 8 | 9 \nPress any key to start .."
    getline 
    print "Enter player 1 name :"
    getline player1
    print "Enter player 2 name :"
    getline player2

    while(1){
      result=2
      while(result!=1){
        print player1"'s move : "
        getline move
        result= validate_move(move,moves_array)
      }
      turn ++;
      result=2 
      moves_array[move]="x"
      game_status(moves_array,turn)

      print "_"moves_array[1]"_|_"moves_array[2]"_|_"moves_array[3]
      print "_"moves_array[4]"_|_"moves_array[5]"_|_"moves_array[6]
      print " "moves_array[7]" | "moves_array[8]" | "moves_array[9]

      while(result!=1){
        print player2"'s move : "
        getline move
        result = validate_move(move,moves_array)
      }
      turn ++;
      moves_array[move]="o"
      game_status(moves_array,turn)

      print "_"moves_array[1]"_|_"moves_array[2]"_|_"moves_array[3]
      print "_"moves_array[4]"_|_"moves_array[5]"_|_"moves_array[6]
      print " "moves_array[7]" | "moves_array[8]" | "moves_array[9]
    }
  }
