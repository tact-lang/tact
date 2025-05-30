contract TestReceiverSlice {
    // Fallback receiver: catches binary messages not matching any other receiver
    receive(msg: Slice) {
        // Fallback handler for binary messages
    }
}
