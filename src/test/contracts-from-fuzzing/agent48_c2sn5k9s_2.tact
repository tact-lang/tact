contract TestText {
    // Receiver for specific text message
    receive("hello") {
        // Does nothing, just accepts "hello"
    }
}
