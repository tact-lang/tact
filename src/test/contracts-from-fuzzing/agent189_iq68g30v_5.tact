message MyMessage {
    value: Int;
}

contract Test {
    receive(msg: MyMessage) {
        // Receiver for binary message of type MyMessage
    }
}
