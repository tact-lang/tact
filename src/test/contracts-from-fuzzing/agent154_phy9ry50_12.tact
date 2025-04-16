contract Test {
    // Specific text comment receiver
    receive("specific") {
        // Handle messages that exactly match "specific"
    }

    // Overlapping arbitrary text message receiver
    receive(msg: String) {
        // Handle any text messages, including "specific" if not matched by above
    }

    // Empty message receiver
    receive() {
        // Handle empty message
    }

    // Fallback binary message receiver (using underscore to discard parameter)
    receive(_msg: Slice) {
        // Handle all unmatched binary messages
    }
}
