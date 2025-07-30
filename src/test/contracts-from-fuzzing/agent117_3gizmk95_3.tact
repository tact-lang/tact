contract Test {
    // Test: arbitrary text message receiver with String parameter
    receive(message: String) {
        // This receiver should handle any arbitrary text message
        // For test purposes, we simply perform a no-op
    }
}
