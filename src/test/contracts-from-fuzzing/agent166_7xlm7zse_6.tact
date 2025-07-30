contract TestBinaryFallback {
    // Receiver for binary messages (fallback handler)
    receive(msg: Slice) {
        // Minimal functionality; just a no-op.
    }
}
