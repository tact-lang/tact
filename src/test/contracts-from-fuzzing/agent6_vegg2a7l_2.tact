contract Test {
    // Literal text receiver test: should trigger when message comment exactly matches "hello"
    receive("hello") {
        // handler for literal text "hello"
    }
}
