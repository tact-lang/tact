contract TestTextReceiver {
    // Specific text receiver: matches exactly "hello"
    receive("hello") {
        // Handle specific text messages
    }
}
