contract TestFallback {
    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // no-op
    }
}
