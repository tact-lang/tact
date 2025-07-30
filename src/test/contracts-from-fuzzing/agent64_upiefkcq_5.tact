contract TestFallback {
    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // do nothing
    }
}

// Minimal contract to test the fallback receiver