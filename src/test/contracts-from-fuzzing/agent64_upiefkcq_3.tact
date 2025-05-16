contract TestArbitraryText {
    // Receiver for arbitrary text messages: should match any string message
    receive(str: String) {
        // do nothing
    }
}

// Minimal contract for testing arbitrary text message receiver