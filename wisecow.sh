
SRVPORT=4499
RSPFILE=response

rm -f $RSPFILE
mkfifo $RSPFILE

export PATH=$PATH:/usr/games

get_api() {
    read line
    echo $line
}

handleRequest() {
    
    get_api
    mod=$(fortune)

    cat <<EOF > $RSPFILE
HTTP/1.1 200


<pre>$(cowsay "$mod")</pre>
EOF
}

prerequisites() {
    echo "Checking prerequisites..."
    echo "PATH: $PATH"

    if command -v cowsay >/dev/null 2>&1; then
        echo "cowsay found at $(command -v cowsay)"
    else
        echo "cowsay not found"
    fi
    
    if command -v fortune >/dev/null 2>&1; then
        echo "fortune found at $(command -v fortune)"
    else
        echo "fortune not found"
    fi

    if command -v cowsay >/dev/null 2>&1 && command -v fortune >/dev/null 2>&1; then
        echo "All prerequisites are installed."
    else
        echo "Install prerequisite."
        exit 1
    fi
}

main() {
    prerequisites
    echo "Wisdom served on port=$SRVPORT..."

    while true; do
        cat $RSPFILE | nc -lN $SRVPORT | handleRequest
        sleep 0.01
    done
}

main
