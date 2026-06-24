contract Test {
    receive("hello") {
        // specific text receiver: only matches messages with exactly "hello"
    }
}
