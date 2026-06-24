contract TestReceiverFallback {
    // This contract handles all unmatched binary messages (fallback) using Slice
    receive(msg: Slice) {
        // fallback handler for binary messages
    }
}
