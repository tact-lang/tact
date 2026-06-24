contract Test {
    receive("test") {
        // Specific text message receiver should process messages with comment "test"
    }

    receive(str: String) {
        // Generic text receiver for any arbitrary text messages
    }

    receive(msg: Slice) {
        // Fallback receiver for any binary message not matched earlier
    }
}
