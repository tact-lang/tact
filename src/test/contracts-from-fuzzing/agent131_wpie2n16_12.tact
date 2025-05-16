message MyMessage {
    value: Int;
}

contract Test {
    receive(msg: MyMessage) {
        // Handler for binary message of type MyMessage
    }
}
