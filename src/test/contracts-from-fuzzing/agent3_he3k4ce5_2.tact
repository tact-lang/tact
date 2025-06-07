contract Test {
    // Receiver for a specific text message: "hello".
    receive("hello") {
        // No operation
    }

    // Fallback to catch other text messages to ensure only "hello" is matched here.
    receive(str: String) {
        // No operation
    }
}
