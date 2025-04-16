contract TestFallbackReceiver {
    executed: Int = 0;

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        self.executed = 42;
    }
}
