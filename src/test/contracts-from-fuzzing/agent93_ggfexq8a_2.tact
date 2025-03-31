contract SpecificTextReceiver {
    // This receiver handles messages with specific text comment "hello"
    receive("hello") {
        // Implementation for 'hello' messages
    }
}
