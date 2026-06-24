contract Test {
    // Test 6: Fallback receiver function that accepts binary messages
    // This should match any binary message that doesn't match earlier receivers (if any exist)
    receive(msg: Slice) {
        // No operation
    }
}
