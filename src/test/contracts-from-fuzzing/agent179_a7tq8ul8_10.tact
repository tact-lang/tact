contract Test10 {
    // Empty message receiver (highest priority)
    receive() {
        // empty receiver
    }

    // Specific text receiver for the comment "test"
    receive("test") {
        // specific text receiver
    }

    // Receiver for arbitrary text messages using a String parameter
    receive(str: String) {
        // text message receiver
    }

    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // fallback receiver
    }
}
