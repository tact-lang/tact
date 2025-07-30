contract Test {
    // Test: fallback receiver for all unmatched binary messages using Slice
    receive(msg: Slice) {
        // Fallback logic: simply no-op
    }
}
