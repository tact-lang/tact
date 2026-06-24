contract Test {
    // Valid fallback receiver for all unmatched binary messages using Slice parameter with empty body
    receive(msg: Slice) {
        // No operation
    }
}
