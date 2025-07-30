contract FallbackReceiver {
    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // Minimal action: read first bit if exists
        let b: Int = msg.loadUint(1);
    }
}
