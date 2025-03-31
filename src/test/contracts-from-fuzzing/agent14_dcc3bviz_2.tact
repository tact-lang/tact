contract TestSpecificText {
    // Receiver for a specific text message literal
    receive("hello") {
        // This receiver should be triggered only for messages equal to "hello"
    }
}
