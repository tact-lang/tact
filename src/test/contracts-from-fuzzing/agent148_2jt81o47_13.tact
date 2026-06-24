contract Test {
    // Receiver for a specific text comment "hello"
    receive("hello") {
        // This receiver is intended for messages with the exact comment "hello"
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // This receiver should process any other text messages
    }
}
