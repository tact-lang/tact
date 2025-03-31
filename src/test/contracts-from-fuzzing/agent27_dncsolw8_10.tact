contract Test {
    state: Int = 0;

    // Receiver for empty messages
    receive() {
        // handling empty message
    }

    // Receiver for specific text messages
    receive("hello") {
        // handling specific text 'hello'
    }

    // Receiver for any arbitrary text messages
    receive(msg: String) {
        // handling arbitrary text messages
    }

    // Fallback receiver for binary messages (Slice)
    receive(msg: Slice) {
        // handling unmatched binary messages
    }
}
