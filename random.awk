#! /usr/bin/awk -f

BEGIN{

  "date +%S" | getline secs
  print (secs*41*37)%10
}
