contract TestWithoutFallback {
    // Specific text message receiver
    receive("hello") {
        // This should match messages with the exact text "hello"
    }

    // Arbitrary text message receiver
    receive(str: String) {
        // This should match any text message that doesn't exactly match a specific text receiver
    }
    
    // Note: No fallback binary receiver provided. According to documentation, if a binary message is sent that
    // does not match the specific text message receivers, the transaction will fail with exit code 130
}
