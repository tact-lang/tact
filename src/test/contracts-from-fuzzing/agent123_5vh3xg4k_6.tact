contract Test {
    // Fallback receiver: catches all unmatched binary messages
    receive(msg: Slice) {
        // No operation
    }
}
