contract Test {
    // Specific text comment receiver, matches only messages with "hello"
    receive("hello") {
        // do nothing
    }
}
