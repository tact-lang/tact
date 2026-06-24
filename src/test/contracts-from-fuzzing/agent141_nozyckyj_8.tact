contract FallbackReceiverTest {
    // Fallback receiver that catches all unmatched binary messages
    receive(msg: Slice) {
        // No operation
    }
}
