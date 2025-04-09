contract Test {
    // Test for specific text comment receiver
    receive("my comment") {
        // This receiver should match messages with exactly "my comment"
    }
}
