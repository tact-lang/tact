contract Test19 {
    // Test 19: Contract without fallback binary receiver
    // This contract only defines receivers for text messages
    receive("test") {
        // Handles message with comment "test"
    }
    receive(text: String) {
        // Handles arbitrary text messages
    }
    
    // Note: There is no fallback binary receiver. If a binary message is received,
    // and it does not match any other receiver type, the message will fail with exit code 130.
}
