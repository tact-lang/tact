contract TestFallback {
    // This receiver is designed as a fallback for all unmatched binary messages
    receive(msg: Slice) {
        // Fallback behavior
    }
}
