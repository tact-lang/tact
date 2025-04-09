contract Test14 {
    // Test 14: Reordering receiver declarations to verify that the order does not affect message matching
    // Receiver for arbitrary text messages is declared before the specific text comment receiver
    receive(str: String) {
        // Should handle any text message not matching a specific comment
    }

    receive("hello") {
        // Should handle text messages with the comment "hello"
    }

    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // This catches all binary messages that don't match any other receiver
    }
}
