contract Test {
    // Fallback receiver: matches all unmatched binary messages
    receive(msg: Slice) {
        // Minimal implementation: do nothing
    }
}
