contract Test {
    // Arbitrary text receiver declared first
    receive(msg: String) {
        // Should catch arbitrary text messages
    }

    // Specific text receiver declared second, but should be prioritized for "hello"
    receive("hello") {
        // Should catch text "hello"
    }
}
