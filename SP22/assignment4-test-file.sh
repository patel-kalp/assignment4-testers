#!/bin/bash

ASSIGNMENT_NAME='sp22-lab4-'
GITHUB_USERNAME='';
COMMIT_ID='';
echo -n "Students GitHub Username: "
read GITHUB_USERNAME
rm -rf $ASSIGNMENT_NAME$GITHUB_USERNAME;
echo -n "Commit ID (<enter> for most recent): "
read COMMIT_ID
git clone git@github.com:PSUCMPSC311/$ASSIGNMENT_NAME$GITHUB_USERNAME
cd $ASSIGNMENT_NAME$GITHUB_USERNAME;
if [ "$COMMIT_ID" = $'\n' ]; then
    echo "main";
else
    git checkout $COMMIT_ID;
fi

echo '';
mkdir costCalc;
make;
echo '';
./tester;
echo '';
echo 'If your output and the expected output have no differences, you will not see anything.'
echo 'Otherwise, it will output the differences as normal.'
echo '----------------No Cache----------------';
echo -n "Simple: ";
./tester -w traces/simple-input >my-output 2>costCalc/SI0;
SI0=$"`cat costCalc/SI0`";
echo -e "${SI0/$'\n'/$'\t'}";
SI0="${SI0/$'\n'*/}";
SI0="${SI0/Cost:\ /}";
diff -u traces/simple-expected-output my-output>costCalc/SID0;
if [ -s costCalc/SID0 ]; then
    echo "Simple: FAILURE"
else
    echo "Simple: SUCCESS" 
fi
echo -n "Linear: ";
./tester -w traces/linear-input >my-output 2>costCalc/LI0;
LI0="`cat costCalc/LI0`";
echo -e "${LI0/$'\n'/$'\t'}";
LI0="${LI0/$'\n'*/}";
LI0="${LI0/Cost:\ /}";
diff -u traces/linear-expected-output my-output>costCalc/LID0;
if [ -s costCalc/LID0 ]; then
    echo "Linear: FAILURE"
else
    echo "Linear: SUCCESS"
fi
echo -n  "Random: ";
./tester -w traces/random-input >my-output 2>costCalc/RA0;
RA0="`cat costCalc/RA0`";
echo -e "${RA0/$'\n'/$'\t'}";
RA0="${RA0/$'\n'*/}";
RA0="${RA0/Cost:\ /}";
diff -u traces/random-expected-output my-output>costCalc/RAD0;
if [ -s costCalc/RAD0 ]; then
    echo "Random: FAILURE"
else
    echo "Random: SUCCESS"
fi
echo '---------------1024 Cache---------------';
echo -n "Simple: ";
./tester -w traces/simple-input -s 1024 >my-output 2>costCalc/SI1;
SI1=$"`cat costCalc/SI1`";
echo -e "${SI1/$'\n'/$'\t'}";
SI1="${SI1/$'\n'*/}";
SI1="${SI1/Cost:\ /}";
diff -u traces/simple-expected-output my-output>costCalc/SID1;
if [ -s costCalc/SID1 ]; then
    echo "Simple: FAILURE"
else
    echo "Simple: SUCCESS"
fi
echo -n "Linear: ";
./tester -w traces/linear-input -s 1024 >my-output 2>costCalc/LI1;
LI1="`cat costCalc/LI1`";
echo -e "${LI1/$'\n'/$'\t'}";
LI1="${LI1/$'\n'*/}";
LI1="${LI1/Cost:\ /}";
diff -u traces/linear-expected-output my-output>costCalc/LID1;
if [ -s costCalc/LID1 ]; then
    echo "Linear: FAILURE"
else
    echo "Linear: SUCCESS"
fi
echo -n "Random: ";
./tester -w traces/random-input -s 1024 >my-output 2>costCalc/RA1;
RA1="`cat costCalc/RA1`";
echo -e "${RA1/$'\n'/$'\t'}";
RA1="${RA1/$'\n'*/}";
RA1="${RA1/Cost:\ /}";
diff -u traces/random-expected-output my-output>costCalc/RAD1;
if [ -s costCalc/RAD1 ]; then
    echo "Random: FAILURE"
else
    echo "Random: SUCCESS"
fi
echo '---------------2048 Cache---------------';
echo -n "Simple: ";
./tester -w traces/simple-input -s 2048 >my-output 2>costCalc/SI2;
SI2="`cat costCalc/SI2`";
echo -e "${SI2/$'\n'/$'\t'}";
SI2="${SI2/$'\n'*/}";
SI2="${SI2/Cost:\ /}";
diff -u traces/simple-expected-output my-output>costCalc/SID2;
if [ -s costCalc/SID2 ]; then
    echo "Simple: FAILURE"
else
    echo "Simple: SUCCESS"
fi
echo -n "Linear: ";
./tester -w traces/linear-input -s 2048 >my-output 2>costCalc/LI2;
LI2="`cat costCalc/LI2`";
echo -e "${LI2/$'\n'/$'\t'}";
LI2="${LI2/$'\n'*/}";
LI2="${LI2/Cost:\ /}";
diff -u traces/linear-expected-output my-output>costCalc/LID2;
if [ -s costCalc/LID2 ]; then
    echo "Linear: FAILURE"
else
    echo "Linear: SUCCESS"
fi
echo -n "Random: ";
./tester -w traces/random-input -s 2048 >my-output 2>costCalc/RA2;
RA2="`cat costCalc/RA2`";
echo -e "${RA2/$'\n'/$'\t'}";
RA2="${RA2/$'\n'*/}";
RA2="${RA2/Cost:\ /}";
diff -u traces/random-expected-output my-output>costCalc/RAD2;
if [ -s costCalc/RAD2 ]; then
    echo "Random: FAILURE"
else
    echo "Random: SUCCESS"
fi
echo '---------------3072 Cache---------------';
echo -n "Simple: ";
./tester -w traces/simple-input -s 3072 >my-output 2>costCalc/SI3;
SI3="`cat costCalc/SI3`";
echo -e "${SI3/$'\n'/$'\t'}";
SI3="${SI3/$'\n'*/}";
SI3="${SI3/Cost:\ /}";
diff -u traces/simple-expected-output my-output>costCalc/SID3;
if [ -s costCalc/SID3 ]; then
    echo "Simple: FAILURE"
else
    echo "Simple: SUCCESS"
fi
echo -n "Linear: ";
./tester -w traces/linear-input -s 3072 >my-output 2>costCalc/LI3;
LI3="`cat costCalc/LI3`";
echo -e "${LI3/$'\n'/$'\t'}";
LI3="${LI3/$'\n'*/}";
LI3="${LI3/Cost:\ /}";
diff -u traces/linear-expected-output my-output>costCalc/LID3;
if [ -s costCalc/LID3 ]; then
    echo "Linear: FAILURE"
else
    echo "Linear: SUCCESS"
fi
echo -n "Random: ";
./tester -w traces/random-input -s 3072 >my-output 2>costCalc/RA3;
RA3="`cat costCalc/RA3`";
echo -e "${RA3/$'\n'/$'\t'}";
RA3="${RA3/$'\n'*/}";
RA3="${RA3/Cost:\ /}";
diff -u traces/random-expected-output my-output>costCalc/RAD3;
if [ -s costCalc/RAD3 ]; then
    echo "Random: FAILURE"
else
    echo "Random: SUCCESS"
fi
echo '---------------4096 Cache---------------';
echo -n "Simple: ";
./tester -w traces/simple-input -s 4096 >my-output 2>costCalc/SI4;
SI4="`cat costCalc/SI4`";
echo -e "${SI4/$'\n'/$'\t'}";
SI4="${SI4/$'\n'*/}";
SI4="${SI4/Cost:\ /}";
diff -u traces/simple-expected-output my-output>costCalc/SID4;
if [ -s costCalc/SID4 ]; then
    echo "Simple: FAILURE"
else
    echo "Simple: SUCCESS"
fi
echo -n "Linear: ";
./tester -w traces/linear-input -s 4096 >my-output 2>costCalc/LI4;
LI4="`cat costCalc/LI4`";
echo -e "${LI4/$'\n'/$'\t'}";
LI4="${LI4/$'\n'*/}";
LI4="${LI4/Cost:\ /}";
diff -u traces/linear-expected-output my-output>costCalc/LID4;
if [ -s costCalc/LID4 ]; then
    echo "Linear: FAILURE"
else
    echo "Linear: SUCCESS"
fi
echo -n "Random: ";
./tester -w traces/random-input -s 4096 >my-output 2>costCalc/RA4;
RA4="`cat costCalc/RA4`";
echo -e "${RA4/$'\n'/$'\t'}";
RA4="${RA4/$'\n'*/}";
RA4="${RA4/Cost:\ /}";
diff -u traces/random-expected-output my-output>costCalc/RAD4;
if [ -s costCalc/RAD4 ]; then
    echo "Random: FAILURE"
else
    echo "Random: SUCCESS"
fi
rm -rf costCalc;
echo '';