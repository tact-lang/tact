message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for typed binary message MyMessage
    receive(msg: MyMessage) {
        // no-operation
    }
}
