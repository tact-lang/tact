contract Test {
    // Test 10: Ambiguous receivers - where a message with a specific text (e.g., "test") should match the literal receiver and not the parameterized string receiver.
    // The presence of both receivers in the same contract is valid as their matching criteria are distinct according to the documentation.

    receive("test") {
        // This receiver should match messages with the exact comment "test"
    }

    receive(str: String) {
        // This receiver should catch any arbitrary text messages that do not match any literal receiver
    }
}
