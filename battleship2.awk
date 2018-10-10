#! /usr/bin/awk -f

function initBattleArea(battleArea){
 print "     1     2     3     4     5     6 " 
  print " -------------------------------------"
  for(row=1;row<=6;row++){
    printf row"|"
    for(column=1;column<=6;column++){
        printf "  "battleArea[row,column]"  |"
    } 
  print "\n -------------------------------------" 
  }
}

function validateAttack(battleArea,row,column){
  if(battleArea[row,column]==" "){
    return 1  
  }
  print "Place already attacked!"
  return 0
}

function checkAttackStatus(battleArea,computerBattleArea,row,column){
  i=int(row);j=int(column)
  if(battleArea[i,j]==computerBattleArea[row,column]){
    battleArea[i,j]="X"
    print "Hit ! " noOfHit;
    noOfHit++;
    if(noOfHit > 10){
      initBattleArea(battleArea);
      print "You Won !"
      exit  
    }  
  }else{
    battleArea[row,column]="O"
  }
  initBattleArea(battleArea)
}
  
function generateBattleArea(computerBattleArea){
  srand();
  shipCount = 0;
  while(shipCount < 11){
    coordinate_x = int(rand()*6)+1;
    coordinate_y = int(rand()*6)+1;
    if(computerBattleArea[coordinate_x,coordinate_y] != " "){
      computerBattleArea[coordinate_x,coordinate_y] = " "
      shipCount++;  
    }
  }  
}

function gameIntro(){
  print "--WELCOME TO BATTLESHIP--"
  print "There are 10 single size ships. You have total 20 attacks."
  print "To attack to specific position enter 'x' coordiante first and then 'y' coordinates."
  print "To win you need to hit all 10 ships using maximum 20 attacks\nBest of luck."
}

BEGIN{
  gameIntro();
  for(row=1;row<=6;row++){
    i=row
    for(column=1;column<=6;column++){
      j=column
      battleArea[row,column]=" "
      computerBattleArea[i,j]="ships"
    } 
  }

  noOfAttacks=0
  noOfHit=0
  srand()
  generateBattleArea(computerBattleArea);
  while(noOfAttacks<21){
    validateMove=0
    checkAttackStatus(battleArea,computerBattleArea,attackPositionRow,attackPositionColumn)
    while(validateMove!=1){
     print "Enter your coordinates row then column:"
     getline attackPositionRow
     getline attackPositionColumn
     validateMove=validateAttack(battleArea,attackPositionRow,attackPositionColumn)
    }
    noOfAttacks++;
  }

  print "You loose. Number of attacks exceeded!"
} 
