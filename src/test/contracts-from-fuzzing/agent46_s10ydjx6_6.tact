message MyMessage {
    a: Int;
}

contract Test {
    // Receiver for typed binary messages using a message (not a struct)
    receive(msg: MyMessage) {
        // Minimal test: do nothing
    }
}
