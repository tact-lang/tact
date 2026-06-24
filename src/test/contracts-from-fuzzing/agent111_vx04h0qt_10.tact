contract Test {
    // Exact match for empty messages
    receive() {
        // Handle empty messages
    }

    // Exact match for specific text 'hello'
    receive("hello") {
        // Handle text 'hello'
    }

    // Catch-all for arbitrary text messages
    receive(str: String) {
        // Handle any text message not caught by specific patterns
    }

    // Fallback for unmatched binary messages
    receive(msg: Slice) {
        // Handle binary messages that don't match other receivers
    }
}
