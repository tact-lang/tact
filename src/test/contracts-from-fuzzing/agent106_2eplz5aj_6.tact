contract TestFallback {
    // Test Case 5: Fallback receiver: catches all unmatched binary messages
    receive(msg: Slice) {
        // Fallback logic for binary messages
    }
}
