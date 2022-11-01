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


paste listd3.dat listde3.dat > ll1.dat



#second one
awk '{print $1}' listde2.dat > listdd1.dat

sed 's/^.......//' listde2.dat > listdd2.dat

paste listdd1.dat listdd2.dat > listdd3.dat


paste listdd3.dat listde3.dat > ll2.dat

cat ll1.dat ll2.dat > ll3.dat



##divide differnt chains
awk '{if ($1 == "A") print $0}' ll3.dat > A.dat 
awk '{if ($1 == "B") print $0}' ll3.dat > B.dat
awk '{if ($1 == "K") print $0}' ll3.dat > K.dat

##find the same number of occupancy and add it up
awk '{sum[$1]+=$2}END{for(c in sum){print c,sum[c]}}' A.dat > Aa.dat
awk '{sum[$1]+=$2}END{for(c in sum){print c,sum[c]}}' B.dat > Bb.dat
awk '{sum[$1]+=$2}END{for(c in sum){print c,sum[c]}}' K.dat > Kk.dat


##find max
awk 'BEGIN {max = 0} {if ($2+0 > max+0) max=$2} END {print max}' Aa.dat > max.dat

##find min
awk 'BEGIN {min = 65536} {if ($2+0 < min+0) min=$2} END {print min}' Aa.dat > min.dat

paste max.dat min.dat > rg.dat

##max-min calculate the range
awk '{print $1-$2}' rg.dat > range.dat



##Put the range into total file
##put the "range" file number after$3
awk '{print $1 " " $2 " " $3""}' td.dat > td2.dat


##Final occupancy value
awk '{print $1 "   "100-($2/$3)*100}' td2.dat > td3.dat

rm td.dat td2.dat




