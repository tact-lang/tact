contract Test {
    // Test 13: Text-specific receiver and arbitrary text receiver
    // According to the documentation, a message with the comment "hello" should be handled by the text-specific receiver
    // while other text messages should fall to the arbitrary text receiver.
    receive("hello") {
        // Specific receiver for text "hello"
    }

    receive(str: String) {
        // Receiver for all other text messages
    }
}
