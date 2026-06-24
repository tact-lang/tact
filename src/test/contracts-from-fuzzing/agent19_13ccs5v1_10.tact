contract Test {
    // Testing ambiguous text message receivers: specific text and arbitrary text
    receive("hello") {
        // Should handle messages with exact text "hello"
    }

    receive(str: String) {
        // Should handle all other text messages
    }
}
