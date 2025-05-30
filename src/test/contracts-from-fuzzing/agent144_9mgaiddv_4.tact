contract ArbitraryTextReceiver {
    // Receiver for arbitrary text messages with an empty body
    receive(str: String) {
        // Empty body, purely to test compilation and matching
    }
}
