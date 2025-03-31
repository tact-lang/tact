contract Test2 {
    // Test 2: Specific text comment receiver
    
    // This receiver should be invoked when the incoming message exactly matches "hello"
    receive("hello") {
        // Specific text response logic
    }
}
