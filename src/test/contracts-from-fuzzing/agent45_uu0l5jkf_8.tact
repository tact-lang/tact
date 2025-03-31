contract FallbackReceiver {
    x: Int = 0;
    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        self.x = 999;
    }
}
