contract Test {
    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // process binary message as a generic slice
    }
}
