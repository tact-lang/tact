contract Test {
    // Specific text receiver: only matches messages with comment "hello"
    receive("hello") {
        // do nothing
    }
}
