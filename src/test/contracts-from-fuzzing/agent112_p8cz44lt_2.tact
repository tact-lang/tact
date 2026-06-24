contract Test {
    // Specific text receiver: should match messages with text "hello"
    receive("hello") {
        // action for matching "hello" comment
    }
}
