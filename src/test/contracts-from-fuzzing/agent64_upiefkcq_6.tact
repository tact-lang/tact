message MyMessage {
    value: Int;
}

contract TestTypedMessage {
    // Receiver for typed binary messages using a proper message definition
    receive(msg: MyMessage) {
        // do nothing
    }
}

// Minimal contract to test typed binary message receiver