message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for typed binary messages using a proper 'message' declaration
    receive(msg: MyMessage) {
        // do nothing
    }
}
