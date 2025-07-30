contract TextSpecificReceiver {
    // Receiver for specific text messages: only accepts text "Hello"
    receive("Hello") {
        // Handling specific text message
    }
}
