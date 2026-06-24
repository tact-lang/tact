contract Test {
    // Test 5: Fallback receiver for binary messages
    // This receiver should catch all messages that are not caught by previous receivers
    receive(msg: Slice) {
        // Code body is empty
    }
}
