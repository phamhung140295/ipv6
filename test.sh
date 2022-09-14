#!/bin/sh
random() {
	tr </dev/urandom -dc A-Za-z0-9 | head -c5
	echo
}
array=(1 2 3 4 5 6 7 8 9 0 a b c d e f)
IP4=$(curl -4 -s icanhazip.com)
IP6=2a09:7c41
LAST_IP6=1cc4
FIRST_PORT=10000
LAST_PORT=10100


gen64() {
	ip64() {
		echo "${array[$RANDOM % 16]}${array[$RANDOM % 16]}${array[$RANDOM % 16]}${array[$RANDOM % 16]}"
	}
	echo "$1:$(ip64):$(ip64):$(ip64):$(ip64):$(ip64):$2"
}
gen_data() {
    seq $FIRST_PORT $LAST_PORT | while read port; do
        echo "$(random)/$(random)/$IP4/$port/$(gen64 $IP6 $LAST_IP6)"
    done
}

gen_data >data.txt
