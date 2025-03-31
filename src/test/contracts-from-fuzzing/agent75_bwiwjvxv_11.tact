contract TestOverlap1 {
    // Test: Overlapping receivers with specific text and arbitrary text
    // According to the documentation, a text message with comment "message" will be handled by the specific receiver
    receive("message") {
        // Specific text receiver
    }

    receive(str: String) {
        // Arbitrary text receiver - should handle messages not matching any specific text
    }
}
