contract Test {
    // Empty message receiver
    receive() {
        // do nothing
    }

    // Specific text comment receiver
    receive("fixed") {
        // do nothing
    }

    // Arbitrary text message receiver
    receive(text: String) {
        // do nothing
    }

    // Binary fallback receiver for all unmatched messages
    receive(msg: Slice) {
        // do nothing
    }
}
