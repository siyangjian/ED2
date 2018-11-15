#!/bin/bash
models="ED BRAMS Ramspost"

for model in ${models}
do
   echo "========================================================================="
   echo " + Model ${model}: "
   echo "   "
   modellines=0
   direcs=$(ls -1 ${model}/src)
   for dir in ${direcs}
   do
      case "${dir}" in
      test_cases|doc|preproc)
         echo "Skip" >> /dev/null
         ;;
      *)
         echo -n "   - Directory ${dir}: "
         files=$(/bin/ls -1 ${model}/src/${dir})
         dirlines=0
         for file in ${files}
         do
            nlines=$(sed '/^ *$/ d' ${model}/src/${dir}/${file} | wc -l)
            let dirlines=${dirlines}+${nlines}
         done
         echo "${dirlines} lines"
         let modellines=${modellines}+${dirlines}
         ;;
      esac
   done
   echo "   - Total: ${modellines}"
   echo "========================================================================="
   echo "   "
   echo "   "
   echo "   "
done
