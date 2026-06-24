contract Test {
    // Receiver for specific text messages
    receive("hello") {
        // Should only match a message exactly "hello"
    }
}
