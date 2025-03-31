contract Test {
    // Test 10: Overlapping message pattern receivers - specific text and arbitrary string
    // This contract defines both a specific text receiver and an arbitrary text receiver.
    // According to documentation, messages matching the specific text should be handled by the specific receiver,
    // while all others should fall into the arbitrary text receiver.

    receive("pattern") {
        // Handles messages with the exact comment "pattern"
    }

    receive(str: String) {
        // Handles all other textual messages
    }
}
