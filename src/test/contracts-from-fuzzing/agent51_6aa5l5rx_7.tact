contract Test {
    // Empty message receiver
    receive() {
        // Handling empty messages
    }

    // Specific text comment receiver
    receive("hello") {
        // Handling messages with comment 'hello'
    }

    // Arbitrary text message receiver
    receive(str: String) {
        // Handling any text messages
    }

    // Fallback binary message receiver
    receive(msg: Slice) {
        // Fallback processing for unmatched binary messages
    }
}
