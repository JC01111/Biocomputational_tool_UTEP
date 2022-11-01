sed 's/^...//g' de.dat > demo.dat 


awk '{if ($2 > 0 && $2 < 33.3) print $0}' demo.dat > d1.dat

##range x<60; color #FF3333 #0:404.A
awk '{print "color" " #f0e68c" " #0:"$1 ".A"}' d1.dat >> color.com



awk '{if ($2 > 33.3 && $2 < 66.6) print $0}' demo.dat > d2.dat

##range x<60; color #FF3333 #0:404.A
awk '{print "color" " #ffd700" " #0:"$1 ".A"}' d2.dat >> color.com



awk '{if ($2 > 66.6) print $0}' demo.dat > d3.dat

##range x<60; color #FF3333 #0:404.A
awk '{print "color" " #ffff00" " #0:"$1 ".A"}' d3.dat >> color.com



##K----yellow  #f0e68c  #ffd700 #ffff00

#A----blue   #000080  #3232cd  #add8e6

#B----pink  #ff1493  #ff69b4  #ffc0cb
