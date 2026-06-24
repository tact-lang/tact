contract TestFallback {
    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // No operation — acts as a fallback handler
    }
}
