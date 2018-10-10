#! /usr/bin/awk -f

BEGIN{
  n=1;score=0;status=1;count=1;
 
  while(status==1){
    status = getline < "questions"
    if(status==1){
      quest[count++]=$0
    }
  }
 
  for(i=1; i<=length(quest);i++){
    split(quest[i],current_q,"|")
    question[i]=current_q[1]
    option_A[i]=current_q[2]
    option_B[i]=current_q[3]
    option_C[i]=current_q[4]
    option_D[i]=current_q[5]
    actual_answer[i]=current_q[6]
  }
 while(status!=2){
    srand()
    ques=int(1+rand()*10)
    print "Q."n"-"question[ques]"\nA."option_A[ques]"\nB."option_B[ques]"\nC."option_C[ques]"\nD."option_D[ques]"\nActual Answer :"actual_answer[ques]
    getline answer
    if(answer==actual_answer[ques]){
      print "That's the correct answer."
      score+=10
    }
    else{
       print "Wrong answer."
       print "Final Score :"score
       print "\nDo you want to continue ? (Yes/No)"
       getline choice
       if(choice=="No"||choice=="N"){
       exit
      }
      else{
          score=0;n=1
        }
    }
  } 
}
