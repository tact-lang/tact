contract Test {
    // Receiver for specific text "hello"
    receive("hello") {
        // Should match when incoming message is exactly "hello"
    }

    // Fallback to avoid no receiver error
    receive() {}
}
