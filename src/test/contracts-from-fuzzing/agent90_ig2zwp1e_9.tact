contract Test {
    // Receiver for specific text messages
    receive("hello") {
        // No operation for exact text
    }
    
    // Receiver for arbitrary text messages
    receive(str: String) {
        // No operation for any text message
    }

    // Receiver for empty messages
    receive() {
        // No operation for empty message
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // No operation for binary messages
    }
}
