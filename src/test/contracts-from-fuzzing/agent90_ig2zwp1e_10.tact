message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for typed binary messages using a message type
    receive(msg: MyMessage) {
        // No operation
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // No operation
    }

    // Receiver for a specific text comment
    receive("hello") {
        // No operation
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // No operation
    }

    // Receiver for empty messages
    receive() {
        // No operation
    }
}
