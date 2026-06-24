contract TestFallback {
    // Fallback receiver for all binary messages unmatched by other receivers
    receive(msg: Slice) {
        // Fallback - intended to catch all binary messages not matched by earlier receivers
    }
}
