# InitialJPFTests
Initial JPF test I/O examples. No edit once finalized.

Required programs to run

Once you get to this directory

1) Build the dockerfile with 

docker build -f Dockerfile . initjpf:latest

2) Run test cases with ./runall.sh 
* the default case to try will be sudo ./runall.sh ./testLists/src_examples/all.txt /root/jpf-symbc/src/examples ./results
* sudo may be required depending on the local setup of docker. If you don't need it, then remove sudo from the third line of eachRound.sh 
* for test cases in src/tests/... change ./testLists/src_examples/all.txt to ./testLists/src___tests/all.txt and /root/jpf-symbc/src/examples to /root/jpf-symbc/src/tests/gov/nasa/jpf/symbc
* set ./results to some other directory if you want stdout and stderr directed to that directory.
