contract Test {
    // Test with multiple receiver types to verify priority matching
    receive("world") {
        // Specific text receiver
    }

    receive(str: String) {
        // Arbitrary text message receiver
    }

    receive(msg: Slice) {
        // Fallback binary message receiver
    }
}
