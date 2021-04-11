#!/bin/bash

GITHUB_USERNAME='';
COMMIT_ID='';
echo -n "Students GitHub Username: "
read GITHUB_USERNAME
rm -rf assignment4-$GITHUB_USERNAME;
echo -n "Commit ID (<enter> for most recent): "
read COMMIT_ID
git clone git@github.com:PSUCMPSC311/assignment4-$GITHUB_USERNAME
cd assignment4-$GITHUB_USERNAME;
if [ -z "$COMMIT_ID" ]; then
    :
else
    git checkout -b $COMMIT_ID;
fi
git branch;
echo '';
mkdir costCalc;
make;
echo '';
./tester;
echo '';
echo '----------------No Cache----------------';
echo -n "Simple: ";
./tester -w traces/simple-input >my-output 2>costCalc/SI0;
SI0=$"`cat costCalc/SI0`";
echo -e "${SI0/$'\n'/$'\t'}";
SI0="${SI0/$'\n'*/}";
SI0="${SI0/Cost:\ /}";
diff -u traces/simple-expected-output my-output;
echo -n "Linear: ";
./tester -w traces/linear-input >my-output 2>costCalc/LI0;
LI0="`cat costCalc/LI0`";
echo -e "${LI0/$'\n'/$'\t'}";
LI0="${LI0/$'\n'*/}";
LI0="${LI0/Cost:\ /}";
diff -u traces/linear-expected-output my-output;
echo -n  "Random: ";
./tester -w traces/random-input >my-output 2>costCalc/RA0;
RA0="`cat costCalc/RA0`";
echo -e "${RA0/$'\n'/$'\t'}";
RA0="${RA0/$'\n'*/}";
RA0="${RA0/Cost:\ /}";
diff -u traces/random-expected-output my-output;
echo -n "Scan: ";
./tester -w traces/scan-input >my-output 2>costCalc/SC0;
SC0="`cat costCalc/SC0`";
echo -e "\t${SC0/$'\n'/$'\t'}";
SC0="${SC0/$'\n'*/}";
SC0="${SC0/Cost:\ /}";
diff -u traces/scan-expected-output my-output;
echo "Total Cost (w/ Simple)  = $(expr $SI0 + $LI0 + $RA0 + $SC0)";
echo "Total Cost (w/o Simple) = $(expr $LI0 + $RA0 + $SC0)";
echo '---------------1024 Cache---------------';
echo -n "Simple: ";
./tester -w traces/simple-input -s 1024 >my-output 2>costCalc/SI1;
SI1=$"`cat costCalc/SI1`";
echo -e "${SI1/$'\n'/$'\t'}";
SI1="${SI1/$'\n'*/}";
SI1="${SI1/Cost:\ /}";
diff -u traces/simple-expected-output my-output;
echo -n "Linear: ";
./tester -w traces/linear-input -s 1024 >my-output 2>costCalc/LI1;
LI1="`cat costCalc/LI1`";
echo -e "${LI1/$'\n'/$'\t'}";
LI1="${LI1/$'\n'*/}";
LI1="${LI1/Cost:\ /}";
diff -u traces/linear-expected-output my-output;
echo -n "Random: ";
./tester -w traces/random-input -s 1024 >my-output 2>costCalc/RA1;
RA1="`cat costCalc/RA1`";
echo -e "${RA1/$'\n'/$'\t'}";
RA1="${RA1/$'\n'*/}";
RA1="${RA1/Cost:\ /}";
diff -u traces/random-expected-output my-output;
echo -n "Scan: ";
./tester -w traces/scan-input -s 1024 >my-output 2>costCalc/SC1;
SC1="`cat costCalc/SC1`";
echo -e "\t${SC1/$'\n'/$'\t'}";
SC1="${SC1/$'\n'*/}";
SC1="${SC1/Cost:\ /}";
diff -u traces/scan-expected-output my-output;
echo "Total Cost (w/ Simple)  = $(expr $SI1 + $LI1 + $RA1 + $SC1)";
echo "Total Cost (w/o Simple) = $(expr $LI1 + $RA1 + $SC1)";
echo '---------------2048 Cache---------------';
echo -n "Simple: ";
./tester -w traces/simple-input -s 2048 >my-output 2>costCalc/SI2;
SI2="`cat costCalc/SI2`";
echo -e "${SI2/$'\n'/$'\t'}";
SI2="${SI2/$'\n'*/}";
SI2="${SI2/Cost:\ /}";
diff -u traces/simple-expected-output my-output;
echo -n "Linear: ";
./tester -w traces/linear-input -s 2048 >my-output 2>costCalc/LI2;
LI2="`cat costCalc/LI2`";
echo -e "${LI2/$'\n'/$'\t'}";
LI2="${LI2/$'\n'*/}";
LI2="${LI2/Cost:\ /}";
diff -u traces/linear-expected-output my-output;
echo -n "Random: ";
./tester -w traces/random-input -s 2048 >my-output 2>costCalc/RA2;
RA2="`cat costCalc/RA2`";
echo -e "${RA2/$'\n'/$'\t'}";
RA2="${RA2/$'\n'*/}";
RA2="${RA2/Cost:\ /}";
diff -u traces/random-expected-output my-output;
echo -n "Scan: ";
./tester -w traces/scan-input -s 2048 >my-output 2>costCalc/SC2;
SC2="`cat costCalc/SC2`";
echo -e "\t${SC2/$'\n'/$'\t'}";
SC2="${SC2/$'\n'*/}";
SC2="${SC2/Cost:\ /}";
diff -u traces/scan-expected-output my-output;
echo "Total Cost (w/ Simple)  = $(expr $SI2 + $LI2 + $RA2 + $SC2)";
echo "Total Cost (w/o Simple) = $(expr $LI2 + $RA2 + $SC2)";
echo '---------------3072 Cache---------------';
echo -n "Simple: ";
./tester -w traces/simple-input -s 3072 >my-output 2>costCalc/SI3;
SI3="`cat costCalc/SI3`";
echo -e "${SI3/$'\n'/$'\t'}";
SI3="${SI3/$'\n'*/}";
SI3="${SI3/Cost:\ /}";
diff -u traces/simple-expected-output my-output;
echo -n "Linear: ";
./tester -w traces/linear-input -s 3072 >my-output 2>costCalc/LI3;
LI3="`cat costCalc/LI3`";
echo -e "${LI3/$'\n'/$'\t'}";
LI3="${LI3/$'\n'*/}";
LI3="${LI3/Cost:\ /}";
diff -u traces/linear-expected-output my-output;
echo -n "Random: ";
./tester -w traces/random-input -s 3072 >my-output 2>costCalc/RA3;
RA3="`cat costCalc/RA3`";
echo -e "${RA3/$'\n'/$'\t'}";
RA3="${RA3/$'\n'*/}";
RA3="${RA3/Cost:\ /}";
diff -u traces/random-expected-output my-output;
echo -n "Scan: ";
./tester -w traces/scan-input -s 3072 >my-output 2>costCalc/SC3;
SC3="`cat costCalc/SC3`";
echo -e "\t${SC3/$'\n'/$'\t'}";
SC3="${SC3/$'\n'*/}";
SC3="${SC3/Cost:\ /}";
diff -u traces/scan-expected-output my-output;
echo "Total Cost (w/ Simple)  = $(expr $SI3 + $LI3 + $RA3 + $SC3)";
echo "Total Cost (w/o Simple) = $(expr $LI3 + $RA3 + $SC3)";
echo '---------------4096 Cache---------------';
echo -n "Simple: ";
./tester -w traces/simple-input -s 4096 >my-output 2>costCalc/SI4;
SI4="`cat costCalc/SI4`";
echo -e "${SI4/$'\n'/$'\t'}";
SI4="${SI4/$'\n'*/}";
SI4="${SI4/Cost:\ /}";
diff -u traces/simple-expected-output my-output;
echo -n "Linear: ";
./tester -w traces/linear-input -s 4096 >my-output 2>costCalc/LI4;
LI4="`cat costCalc/LI4`";
echo -e "${LI4/$'\n'/$'\t'}";
LI4="${LI4/$'\n'*/}";
LI4="${LI4/Cost:\ /}";
diff -u traces/linear-expected-output my-output;
echo -n "Random: ";
./tester -w traces/random-input -s 4096 >my-output 2>costCalc/RA4;
RA4="`cat costCalc/RA4`";
echo -e "${RA4/$'\n'/$'\t'}";
RA4="${RA4/$'\n'*/}";
RA4="${RA4/Cost:\ /}";
diff -u traces/random-expected-output my-output;
echo -n "Scan: ";
./tester -w traces/scan-input -s 4096 >my-output 2>costCalc/SC4;
SC4="`cat costCalc/SC4`";
echo -e "\t${SC4/$'\n'/$'\t'}";
SC4="${SC4/$'\n'*/}";
SC4="${SC4/Cost:\ /}";
diff -u traces/scan-expected-output my-output;
echo "Total Cost (w/ Simple)  = $(expr $SI4 + $LI4 + $RA4 + $SC4)";
echo "Total Cost (w/o Simple) = $(expr $LI4 + $RA4 + $SC4)";
rm -rf costCalc;
git branch -d $COMMIT_ID
echo '';
