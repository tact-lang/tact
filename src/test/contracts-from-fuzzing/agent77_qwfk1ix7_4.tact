contract TestFallbackReceiver {
    receive(msg: Slice) {
        // fallback receiver for all unmatched binary messages
    }
}
