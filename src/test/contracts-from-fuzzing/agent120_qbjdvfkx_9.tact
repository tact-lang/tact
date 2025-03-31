contract Test {
    // Test matching prioritization with both literal and generic text receivers
    // According to documentation, literal text receivers should be matched before generic string receivers when the message exactly matches.
    
    receive("hello") {
        // handle explicit "hello" messages
    }

    receive(str: String) {
        // handle all other text messages
    }

    receive(_: Slice) {
        // fallback for binary messages
    }

    // dummy receive for empty message to ensure it's separated
    receive() {
        // handle empty messages
    }

    // The contract is minimal and designed only for message matching testing.
    // Note: As the matching order is determined at runtime, this test only confirms that the contract compiles with multiple receivers.
}
