#echo "Running $4/$1 on CPU Core #$3. Outputs going to $5/$2.txt and $5/$2.errors.txt"

bash -c "sudo docker run --cpuset-cpus=$3 --rm initjpf:latest java -jar /root/jpf-core/build/RunJPF.jar $4/$1" 1> "$5/$2".txt 2> "$5/$2".errors.txt
# cat ./results/"$2".txt

echo "$(date +"%I:%M:%S"), [Core #$3]: Finished $4/$1" "___________ Wrote to: $5/$2.txt" 
