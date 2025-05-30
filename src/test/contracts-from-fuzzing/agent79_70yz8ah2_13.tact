contract TestReceiverPrioritization {
    // Receiver for a specific text message "hello"
    receive("hello") {
        // Handle specific text message "hello"
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Handle arbitrary text message
    }

    // Fallback receiver for all unmatched binary messages (Slice)
    receive(msg: Slice) {
        // Fallback processing
    }
}
