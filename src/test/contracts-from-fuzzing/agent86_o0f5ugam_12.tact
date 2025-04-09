contract Test {
    // Receiver for a specific text message
    receive("hello") {
        // This receiver should match messages with the exact comment "hello"
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // This receiver should match any text message that doesn't have a specific match
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // This receiver should catch all binary messages that don't match other receivers
    }
}
