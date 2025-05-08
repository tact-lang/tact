contract Test {
    // All receiver functions for overlapping scenarios
    // 1. Empty message receiver
    receive() {
        // empty message
    }

    // 2. Specific text comment receiver
    receive("hello") {
        // handles "hello" as comment
    }

    // 3. Arbitrary text message receiver
    receive(text: String) {
        // handles all text messages
    }

    // 4. Fallback binary message receiver
    receive(msg: Slice) {
        // handles binary messages
    }
}
