##depart the donor from the file  
awk '{print $1}' hbonds-details.dat > list1.dat

awk '{print $2}' hbonds-details.dat > list2.dat

awk '{print $3}' hbonds-details.dat > list3.dat


##remove the unuseful info
sed 's/Seg/ /g' list1.dat | sed 's/-/ /g' | sed 's/P1/ /g' | sed 's/Main//g' | sed 's/Side//g' > listde1.dat

sed 's/Seg/ /g' list2.dat | sed 's/-/ /g' | sed 's/P1/ /g' | sed 's/Main//g' | sed 's/Side//g' > listde2.dat

sed 's/%//g' list3.dat > listde3.dat

rm list1.dat list2.dat list3.dat 


#change the format for Chimera (first one)
awk '{print $1}' listde1.dat > listd1.dat

sed 's/^.......//' listde1.dat > listd2.dat

paste listd1.dat listd2.dat > listd3.dat

awk '{print $2 "." $1}' listd3.dat > d1.dat

paste d1.dat listde3.dat > dd1.dat

#delete unuseful data
rm listd1.dat listd2.dat listd3.dat d1.dat listde1.dat


#second one
awk '{print $1}' listde2.dat > listdd1.dat

sed 's/^.......//' listde2.dat > listdd2.dat

paste listdd1.dat listdd2.dat > listdd3.dat

awk '{print $2 "." $1}' listdd3.dat > d2.dat

paste d2.dat listde3.dat > dd2.dat

##delete unuseful data
rm d2.dat listde2.dat listde3.dat listdd2.dat
rm listdd3.dat listdd1.dat


##two files to one file
cat dd1.dat dd2.dat > dd3.dat

rm dd1.dat dd2.dat


##find the same number of occupancy and add it up
awk '{sum[$1]+=$2}END{for(c in sum){print c,sum[c]}}' dd3.dat > td.dat

rm dd3.dat

#sort dd4.dat > td.dat


##find max
awk 'BEGIN {max = 0} {if ($2+0 > max+0) max=$2} END {print max}' td.dat > max.dat

##find min
awk 'BEGIN {min = 65536} {if ($2+0 < min+0) min=$2} END {print min}' td.dat > min.dat

paste max.dat min.dat > rg.dat

##max-min calculate the range
awk '{print $1-$2}' rg.dat > range.dat

rm max.dat min.dat rg.dat


##Put the range into total file
##put the "range" file number after$3
awk '{print $1 " " $2 " " $3"315.58"}' td.dat > td2.dat


##Final occupancy value
awk '{print $1 "   "100-($2/$3)*100}' td2.dat > td3.dat

rm td.dat td2.dat



## Output to Chimera
#transparency 0,r  #0:156-158.A,158.B

#awk '{print $2 ",r  " "#0:" $1 }' td3.dat | tr "\n" " " >> color.txt





awk '{if ($2 > 0 && $2 < 33.3) print $0}' d.dat > dd.dat

##range x<60; color #FF3333 #0:404.A
awk '{print "color" " #FF0000" " #0:"$1 ".A"}' dd.dat > color.com



awk '{if ($2 > 60) print $0}' d.dat > dd.dat

##range x<60; color #FF3333 #0:404.A
awk '{print "color" " #FF0000" " #0:"$1 ".A"}' dd.dat > color.com
 







color 
#FF0000 -> (0,255) gradient

color #FF0000  #0:233.K

FF-FF-FF = 255-255-255 RGB
https://www.rapidtables.com/web/color/RGB_Color.html







