struct MyMessage {
    value: Int;
}

contract TestContract {
    receive() {
        let msg = MyMessage{value: 1}.toCell();
        send(SendParameters{value: 1, bounce: false, to: myAddress(), body: msg});
    }
}