contract Test {
    // Test fallback receiver using Slice to handle all unmatched binary messages
    receive(msg: Slice) {
        // Fallback handler code
    }

    // Empty receiver to ensure complete compilation
    receive() {}
}
