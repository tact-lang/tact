contract TestText {
    // This receiver is designed to match messages with an exact text comment "hello"
    receive("hello") {
        // do nothing
    }
}
