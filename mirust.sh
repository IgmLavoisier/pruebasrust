touch pruebarust.bak
while [ true ]
do
   clear
   fu=fuente.rs
   cp  $fu   pruebarust.bak
   nvim $fu
   echo "****************************************************************************"
   echo "****************************************************************************"
   echo "****************************************************************************"
   echo "****************************************************************************"
   echo "****************************************************************************"

   cp $fu  pruebas/src/main.rs


   cd pruebas
   cargo build
   re=$?
   cd -

   if [ $re -eq 0 ]
   then
      cd pruebas
      cargo fmt  
      cd - 
      cp pruebas/src/main.rs $fu

      echo "==============================================================="
      echo 
      ./pruebas/target/debug/pruebas
      echo 
      echo "==============================================================="

      grep "^<ulti>" prueba.hist | grep -v "<ulti>//@@@@@@@@@@@" | sed "s/^<ulti>//g" > pruebarust.ult
      diff -qbB $fu pruebarust.ult
      if [ $? -ne 0 ]
      then
         sdiff $fu pruebarust.ult
         echo "INTRO PARA MACHACAR EL ULTIMO O ALGO PARA NUEVO:"
         read res
         if [ -z "$res" ]
         then
            echo "<<<<<ALGO>>>>> machacamos  "
            grep -v "^<ulti>"   prueba.hist   > prueba.hist.tmp    
	    mv prueba.hist.tmp  prueba.hist  
         else
            echo "<<<<<INTRO>>>> conservamos "
            sed "s/^<ulti>//g"  prueba.hist   > prueba.hist.tmp    
	    mv prueba.hist.tmp  prueba.hist  
         fi

	 echo "//@@@@@@@@@@@"$(date +%d-%m-%Y,%A)   | sed "s/^/<ulti>/g" >> prueba.hist
         cat $fu            | sed "s/^/<ulti>/g" >> prueba.hist
      fi
   fi

   echo intro
   read

done
#^
