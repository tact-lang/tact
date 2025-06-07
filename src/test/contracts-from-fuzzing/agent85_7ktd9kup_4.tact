contract Test {
    // Fallback receiver to catch all unmatched binary messages
    receive(msg: Slice) {}
}