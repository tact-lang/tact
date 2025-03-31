contract TestMixText {
    // Test: Overlapping text receivers where a specific literal receiver and an arbitrary text receiver are declared.
    // According to documentation a message with literal "123" should be matched by the specific literal receiver,
    // and any other text should fall to the arbitrary text receiver.

    // Specific text receiver for "123"
    receive("123") {
        // handle text message "123"
    }

    // Arbitrary text receiver for any other text message
    receive(str: String) {
        // handle any other arbitrary text message
    }

    // Fallback for empty messages (internal messages with null body)
    receive() {
        // handle empty internal message
    }
}
