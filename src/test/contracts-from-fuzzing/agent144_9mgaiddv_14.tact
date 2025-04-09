contract ReorderedReceivers {
    // Arbitrary text message receiver declared first
    receive(str: String) {
        // Using the message as is
        let _ = str;
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Minimal usage
        let flag: Int = msg.loadUint(1);
    }

    // Specific text receiver for "test" declared last
    receive("test") {
        // This should be prioritized for the exact text "test"
    }
}
