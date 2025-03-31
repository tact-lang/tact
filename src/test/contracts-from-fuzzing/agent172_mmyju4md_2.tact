contract Test {
    // Test 2: Specific text comment receiver: matches only messages with the exact text "hello"
    receive("hello") {
        // Receiver for specific text "hello"
    }
}
