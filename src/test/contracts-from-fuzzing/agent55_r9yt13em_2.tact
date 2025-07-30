contract Test {
    receive("hello") {
        // This receiver should handle messages with exact text "hello"
    }
}
