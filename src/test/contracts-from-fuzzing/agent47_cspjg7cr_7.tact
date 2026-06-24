message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for typed binary messages using a custom message type
    receive(msg: MyMessage) {
        // minimal implementation
    }
}
