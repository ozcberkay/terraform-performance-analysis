x=1
while [ $x -le 10 ]
do
  terraform apply -auto-approve
  terraform destroy -auto-approve
  x=$(( $x + 1 ))
done
