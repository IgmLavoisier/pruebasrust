n=1
datos=$(grep -n @@@@@@@ prueba.hist | cut -d':' -f1)
while [ true ]
do
   m=$(expr $n + 1)
   d=$(echo $datos | cut -d' ' -f $n)
   h=$(echo $datos | cut -d' ' -f $m)
   H=$(expr $h - 1)
   echo "---------- $n -------------- $d $H"
   cp  tmp_mues.rc  tmp_mues.old
   sed -n $d,${H}p prueba.hist  > tmp_mues.rc 
   if [ $? -ne 0 ]
   then
      break
   fi 
   n=$m
   grep -qi $1 tmp_mues.rc  
   if [ $? -eq 1 ]
   then
      continue
   fi 
   echo
   echo
   cat tmp_mues.rc 
   echo 
   read -p intro dato
   if [ ! -z $dato ]
   then
      case $dato in
      d) 
        sdiff tmp_mues.rc tmp_mues.old
        n=$(expr $n - 1 )
	;;
      r) 
        if [ $n -gt 2 ]
        then
           n=$(expr $n - 2 )
        fi 
	;;
      v)
        vi tmp_mues.rc
        rustc tmp_mues.rc
        if [ $? -eq 0 ]
        then
          D=$(expr $d - 1)
          sed -n  1,${D}p prueba.hist   >  tmp_mues_1
          cat tmp_mues.rc               >> tmp_mues_1
          sed -n $h,10000p prueba.hist  >> tmp_mues_1
          mv tmp_mues_1 prueba.hist
        fi
	;;
      b)
          D=$(expr $d - 1)
          sed -n  1,${D}p prueba.hist   >  tmp_mues_1
          sed -n $h,10000p prueba.hist  >> tmp_mues_1
          mv tmp_mues_1 prueba.hist
	;;
      esac
      datos=$(grep -n @@@@@@@ prueba.hist | cut -d':' -f1)
   fi
done 
