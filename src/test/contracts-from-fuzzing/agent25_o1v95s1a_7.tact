contract TestContract {
    receive() {
        send(SendParameters{value: 1000000000000000000, bounce: false, to: myAddress()});
    }
}