#! /usr/bin/awk -f

function print_block(box){
  print box[1]"\t"box[2]"\t"box[3]"\n"
  print box[4]"\t"box[5]"\t"box[6]"\n" 
  print box[7]"\t"box[8]"\t"box[9]"\n"   
}

function move_left(box,index_1,index_2){
    print "w-up\ts-down\td-right\ya-left"
    getline move
    if(move=="d"){
      if(index_1==1||index_1==2){box[3]=box[index_1];box[index_1]="--"}
      if(index_1==4||index_1==5){box[6]=box[index_1];box[index_1]="--"}
      if(index_1==7||index_1==8){box[9]=box[index_1];box[index_1]="--"} 
      
      if(index_2==1||index_2==2){box[3]=box[index_2];box[index_2]="--"}
      if(index_2==4||index_2==5){box[6]=box[index_2];box[index_2]="--"}
      if(index_2==7||index_2==8){box[9]=box[index_2];box[index_2]="--"}  
    } 
    if(move=="a"){
      if(index_1==2||index_1==3){box[1]=box[index_1];box[index_1]="--"}
      if(index_1==5||index_1==6){box[4]=box[index_1];box[index_1]="--"}
      if(index_1==8||index_1==9){box[7]=box[index_1];box[index_1]="--"} 
      
      if(index_2==2||index_2==3){box[1]=box[index_2];box[index_2]="--"}
      if(index_2==5||index_2==6){box[4]=box[index_2];box[index_2]="--"}
      if(index_2==8||index_2==9){box[7]=box[index_2];box[index_2]="--"}  
    }     
    if(move=="w"){
      if(index_1==4||index_1==7){box[3]=box[index_1];box[index_1]="--"}
      if(index_1==5||index_1==8){box[6]=box[index_1];box[index_1]="--"}
      if(index_1==6||index_1==9){box[9]=box[index_1];box[index_1]="--"} 
      
      if(index_2==4||index_2==7){box[3]=box[index_2];box[index_2]="--"}
      if(index_2==5||index_2==8){box[6]=box[index_2];box[index_2]="--"}
      if(index_2==6||index_2==9){box[9]=box[index_2];box[index_2]="--"}  
    } 
    if(move=="s"){
      if(index_1==1||index_1==4){box[1]=box[index_1];box[index_1]="--"}
      if(index_1==2||index_1==5){box[4]=box[index_1];box[index_1]="--"}
      if(index_1==3||index_1==6){box[7]=box[index_1];box[index_1]="--"} 
      
      if(index_2==1||index_2==4){box[1]=box[index_2];box[index_2]="--"}
      if(index_2==2||index_2==5){box[4]=box[index_2];box[index_2]="--"}
      if(index_2==3||index_2==6){box[7]=box[index_2];box[index_2]="--"}  
    } 
    print_block(box)
}

function generate_index(){
    
}

BEGIN{
  line="--|--|--|--|--|--|--|--|--"
  split(line,box,"|")
  srand()
  index_1=int(1+rand()*10)
  index_2=int(1+rand()*10)
  box[index_1]=2
  box[index_2]=4
  print_block(box)
  move_left(box,index_1,index_2)

}
