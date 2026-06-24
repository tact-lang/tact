message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for typed binary messages using defined message type
    receive(msg: MyMessage) {
        // Handler for messages of type MyMessage
    }
}
