message MyMessage {
    value: Int;
}

contract TestTypedMsg {
    // Receiver for typed binary messages, as per documentation
    receive(msg: MyMessage) {
        // minimal implementation
    }
}
