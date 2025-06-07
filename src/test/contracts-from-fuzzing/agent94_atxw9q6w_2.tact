contract Test {
    // Test 2: Specific text comment receiver
    receive("hello") {
        // This receiver should only be called when the comment exactly matches "hello"
    }
}
