contract Test {
    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // empty body to test Slice receiver matching
    }
}
