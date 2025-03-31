contract TestReceiverOrder {
    // Arbitrary text message receiver
    receive(str: String) {
        // Dummy implementation
    }

    // Specific literal text receiver (should take precedence for exact match messages)
    receive("hello") {
        // Dummy implementation
    }

    // Fallback binary receiver
    receive(msg: Slice) {
        // Dummy implementation
    }
}
