contract Test {
    // Test 11: Contract with literal text and parameterized string receivers, without a fallback binary receiver.
    // According to the documentation, if no receiver matches a binary message, the transaction should fail with exit code 130 (at runtime).
    // This contract is valid at compile time.

    receive("hello") {
        // Matches exact "hello" text messages
    }

    receive(str: String) {
        // Matches all other text messages
    }
}
