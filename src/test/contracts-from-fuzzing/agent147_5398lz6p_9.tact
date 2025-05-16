contract TestTextPrioritization {
    // Receiver for specific literal text
    receive("match") {
        // This function should only handle messages with text exactly "match"
    }

    // Receiver for arbitrary text messages
    receive(msg: String) {
        // This should catch any text message not exactly equal to "match"
    }
}
