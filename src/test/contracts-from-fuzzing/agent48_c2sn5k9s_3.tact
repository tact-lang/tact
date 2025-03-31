contract TestArbitraryText {
    // Receiver that handles arbitrary text messages
    receive(text: String) {
        // no-op: just accepts any text message
    }
}
