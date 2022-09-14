
IP4=$(curl -4 -s icanhazip.com)
IP6=2a09:7c41
IP6_2=1cc4
FIRST_PORT=10000
LAST_PORT=20000


gen64() {
	ip64() {
		echo "${array[$RANDOM % 16]}${array[$RANDOM % 16]}${array[$RANDOM % 16]}${array[$RANDOM % 16]}"
	}
	echo "$1:$(ip64):$(ip64):$(ip64):$(ip64):$(ip64):$2"
}
gen_data() {
    seq $FIRST_PORT $LAST_PORT | while read port; do
        echo "$(random)/$(random)/$IP4/$port/$(gen64 $IP6 $IP6_2)"
    done
}

gen_data >data.txt
