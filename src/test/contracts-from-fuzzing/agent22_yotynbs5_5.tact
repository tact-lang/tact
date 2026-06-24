contract TestFallback {
    // Test receiver for fallback binary messages
    receive(msg: Slice) {
        // Fallback receiver, does nothing
        let x = 0;
    }
}
