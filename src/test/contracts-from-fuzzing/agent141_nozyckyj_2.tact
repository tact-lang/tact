contract SpecificTextReceiver {
    // Receiver for a specific text comment "hello"
    receive("hello") {
        // Code that handles messages with exact comment "hello"
    }
}
