contract Test {
    // Receiver for all unmatched binary messages (fallback)
    receive(msg: Slice) {
        // no-operation
    }
}
