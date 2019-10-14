# > ./results/"{2}".txt

if [ "$#" -ne 3 ]; then
  echo "USAGE: sudo ./runall.sh targetJPFs.txt pathInDocker outputDirectory"
  exit 1
fi

FILE=$1

mkdir -p $3

A="$(cat $FILE | wc -l)"
B=$(grep -c ^processor /proc/cpuinfo)
B=`expr $B - 1`
CPUS=$([ $A -le $B ] && echo "$A" || echo "$B")

#echo $2 $B

parallel -j7 --link ./eachRound.sh {1} {2} {3} $2 $3 \
    ::: $(cat $FILE) \
    ::: $(cat $FILE | sed 's/\//\_/g' | sed 's/\.jpf//g') \
    ::: $(seq 0 $CPUS)
