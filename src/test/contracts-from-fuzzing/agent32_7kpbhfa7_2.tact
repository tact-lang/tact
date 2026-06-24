contract Test {
    // Test 2: Specific text comment receiver
    // This receiver matches messages exactly equal to "hello"
    receive("hello") {
        // Code body is empty
    }
}
