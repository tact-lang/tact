contract Test {
    receive("hello") {
        // This receiver should handle messages with the specific text comment "hello"
    }
}
