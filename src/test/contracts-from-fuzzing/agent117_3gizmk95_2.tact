contract Test {
    // Test: specific text comment receiver
    receive("hello") {
        // This receiver should handle messages that exactly match 'hello'
    }
}
