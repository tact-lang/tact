contract Test {
    // Receiver for text messages with specific comments
    receive("hello") {
        // This will trigger only for messages containing "hello"
    }
}
