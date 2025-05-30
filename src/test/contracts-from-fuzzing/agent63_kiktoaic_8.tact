contract TestAmbiguity {
    // Verify that specific text receiver has precedence over arbitrary text receiver
    receive("hello") {
        // Specific handler for "hello"
    }
    
    receive(str: String) {
        // Fallback handler for any text message (non-empty or not matched by specific)
    }
}
