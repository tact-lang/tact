contract TestAmbiguity {
    // Receiver for specific text message
    receive("hello") {
        // Implementation for specific "hello" message
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Implementation for arbitrary text messages
        str;
    }
}
