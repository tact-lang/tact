contract TestArbitraryText {
    // Receiver for arbitrary text messages
    receive(str: String) {
        // This should catch any text messages not caught by fixed text receivers
    }
}
