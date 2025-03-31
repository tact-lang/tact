contract Test3 {
    // Test 3: Arbitrary text message receiver
    // This receiver should be invoked when the incoming message is any text that doesn't match a specific text
    receive(str: String) {
        // Process the incoming string message
        // No action; intended for testing compilation
    }
}
