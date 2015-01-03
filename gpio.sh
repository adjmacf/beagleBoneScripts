echo "what pin would you like to use?"
read pin
printf "$pin" > /sys/class/gpio/export    #writes pin number to export

echo "would you like the pin to be in or out (input or output)?"
read mode
printf "$mode" > /sys/class/gpio/gpio"$pin"/direction #sets direction

if [ "$mode" == "out" ]; then
	echo "would you like the pin to be 1 or 0(high or low)"
	read state
	printf "$state" > /sys/class/gpio/gpio"$pin"/value #writes pin high or low
	
else
	while [ true ]
	do
	echo "the value of that pin is:"   
	cat /sys/class/gpio/gpio"$pin"/value    #reads pin value every 5 seconds
	sleep 5
	done
fi
