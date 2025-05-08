contract Test {
    // Test 9: Overlapping message receivers for text messages
    // This contract declares both a specific text comment receiver and a generic arbitrary text message receiver.
    // According to the documentation, a message with the exact text "hello" should be processed by the specific receiver, 
    // while other text messages should go to the generic receiver.

    receive("hello") {
        // Specific receiver for text "hello"
    }

    receive(str: String) {
        // Generic receiver for any arbitrary text message
    }
}
