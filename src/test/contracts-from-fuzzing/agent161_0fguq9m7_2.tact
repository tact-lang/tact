contract Test {
    // Receiver for a specific text message
    receive("hello") {
        // Matched only when message equals "hello"
    }
}
