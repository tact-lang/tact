message MyMessage {
    value: Int;
}

contract TestTyped {
    receive(msg: MyMessage) {
        // Handle typed binary messages: MyMessage
    }
    receive(msg: Slice) {
        // Fallback receiver for all unmatched binary messages
    }
}
