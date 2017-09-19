echo -n "" > output.out #clear the contents of output.out file
dataFolder=data #folder name containing programs
OUTFILE=output.out
for dir in ./$dataFolder/*/
do
    dir=${dir%*/}
    folder=${dir##*/}
    echo `echo Student: $folder`
    counter="1"
    NAME=testcase
    FORMAT=.txt
    TestCaseFile="testcase.txt" # name of file containing testcase
    ProgramName="a1_p17.py"   # file name of the program
    ProgramFullName=`echo ./$dataFolder/$folder/$ProgramName`
    echo `echo PATH: $ProgramFullName`
    echo "________________________________________________________________________" >> $OUTFILE
    echo  $folder >>$OUTFILE
    echo "________________________________________________________________________" >> $OUTFILE
    echo Testcases running from: >>$OUTFILE
    echo Testcases running from:
    while [  -f "$TestCaseFile"  ]; do
        echo `echo $TestCaseFile :` >>$OUTFILE
        echo "|------------|" >>$OUTFILE
        python3 $ProgramFullName < $TestCaseFile >> $OUTFILE 2> "error.err" #change the python version here
        TestCaseFile=`echo $NAME$counter$FORMAT`
         echo $TestCaseFile
        ((counter++))
    done
    echo
done
