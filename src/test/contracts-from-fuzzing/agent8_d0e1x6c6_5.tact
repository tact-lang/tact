message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for typed binary messages
    receive(msg: MyMessage) {
        // Process binary message of type MyMessage
    }
}