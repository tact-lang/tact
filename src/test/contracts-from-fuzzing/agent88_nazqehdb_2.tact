contract Test {
    // Test 2: Receiver for specific text message pattern "hello"
    receive("hello") {
        // intended to handle messages with text "hello"
    }
}