contract Test {
    // Arbitrary text receiver with underscore parameter
    receive(_: String) {
        // This receiver should catch arbitrary text messages
    }

    // Empty message receiver
    receive() {
        // This receiver should catch empty messages
    }

    // Specific text receiver for "hello"
    receive("hello") {
        // This receiver should catch messages with "hello"
    }

    // Fallback binary receiver
    receive(msg: Slice) {
        // This receiver should catch unmatched binary messages
    }
}
