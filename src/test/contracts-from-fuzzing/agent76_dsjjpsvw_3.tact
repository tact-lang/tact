contract Test {
    // Test 2: Specific text comment receiver function 
    // Should match messages with the exact comment "hello"
    receive("hello") {
        // no operation
    }
}
