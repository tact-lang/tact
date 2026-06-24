contract TestOrder {
    // Receiver for arbitrary text messages
    receive(str: String) {
        // Process any arbitrary text message
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback processing
    }

    // Receiver for empty messages
    receive() {
        // Process empty message
    }

    // Receiver for specific text message "test"
    receive("test") {
        // Process message with comment "test"
    }
}
