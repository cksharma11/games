#! /usr/bin/awk -f

BEGIN{
  srand()
  print "--WELCOME TO STEP CRICKET--"
  print "Enter the team name :"
  getline team_name
  runs="1 2 3 4 6 1 2 3 4 2 2 1 OUT"
  split(runs,run," ")
  print "Other team won the toss end elected to bat first" 
  target=int(200+rand*10)+5
  print "Target : "target
  wk=0;over=0;
  while(wk<10 && over !=15){
      ball++
      printf "hit enter to stroke : "
      getline
      if(ball==6){
        ball=0
        over++
      }
      over_display=over"."ball" Overs"
      remaining_over=int(((15*6)-((over*6)+ball))/6)"."(((15*6)-((over*6)+ball))%6)
      stroke=int(rand()*13)
      print "You hit "run[stroke]
      if(stroke==OUT){
        wk++ 
        print "-------------------"
        print "Player "wk" got out"
        print "-------------------" 
      }
      else{
        team_score+=run[stroke]
        print "-----------------------------------------------------"
        print team_name "|" team_score"-"wk"| Over "over_display"| Target "(team_score-target)" to win in "remaining_over
        print "-----------------------------------------------------"
      }
      if(team_score>target){
        print "Congrats! You Won by "(10-wk)" Wickets" 
        exit 
      }
  }
  if(team_score==target){
    print "--Match Draw--"
  }else
  print "You loose by "(target-team_score)" runs\nBetter luck next time." 
}
