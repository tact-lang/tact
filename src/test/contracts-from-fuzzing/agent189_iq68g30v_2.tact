contract Test {
    receive("hello") {
        // Specific text receiver: triggers on messages with exact text "hello".
    }
}
