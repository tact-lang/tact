contract Test {
    // Receiver for arbitrary text messages using a String parameter
    // It should handle any text that doesn't match a specific text receiver
    receive(msg: String) {
        // do nothing
    }
}
