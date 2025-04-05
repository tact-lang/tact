fun createParams(): SendParameters {
    return SendParameters{value: 1, bounce: false, to: myAddress()};
}

contract TestContract {
    receive() {
        send(createParams());
    }
}