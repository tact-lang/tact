contract Test {
    // Receiver for specific text message (match comment literal)
    receive("hello") {
        // This receiver triggers when the incoming message exactly matches "hello"
    }
}
