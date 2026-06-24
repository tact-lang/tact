contract TestContract {
    receive() {
        send(SendParameters{value: 1, bounce: false, to: myAddress(), mode: 64});
    }
}