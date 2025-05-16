message SimpleMessage {
    value: Int;
}

contract SimpleContract {
    receive(msg: SimpleMessage) {
        // Simple receive function
    }
}