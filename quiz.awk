#! /usr/bin/awk -f

BEGIN{
  FS="|"
  i=1
  score=0
  status=0
  srand()
  getline a
}
{
  question[NR]=$1;
  option_A[NR]=$2;
  option_B[NR]=$3;
  option_C[NR]=$4;
  option_D[NR]=$5;
  answer[NR]=$6;  
}
END{
  while(status!=1){
    ques=int(1+rand()*10);
    print "Q."i"-"question[ques]"\nA."option_A[ques]"\nB."option_B[ques]"\nC."option_C[ques]"\nD."option_D[ques]"\nType your answer :"
    print "Ans : "answer[ques]
    getline -v ans
    print "Hello "ans 
    i++
    if(ans==answer[ques]){
      print "Correct Answer."
      score+=10
    }
    else{
      print "Final Score :"score
      status=1  
    }
  }
}
