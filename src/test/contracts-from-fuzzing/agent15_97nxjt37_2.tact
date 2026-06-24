contract Test {
    // Receiver for specific text comment
    receive("hello") {
        // Handles messages that exactly equal "hello"
    }
}
