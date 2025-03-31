message MyMessage {
    value: Int;
}

contract Test {
    // Test: receiver for typed binary messages using user-defined message type
    receive(msg: MyMessage) {
        // Body left intentionally blank
    }
}
