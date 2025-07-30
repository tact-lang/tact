contract Test {
    state: Int = 0;

    // Receiver for specific text comments
    receive("hello") {
        // For messages with text "hello"
    }
}
