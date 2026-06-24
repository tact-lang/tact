contract Test {
    // Specific text receiver for 'text'
    receive("text") {
        // This should handle only messages with exactly the comment "text"
    }
    
    // Arbitrary text receiver for any text messages
    receive(str: String) {
        // This should catch all text messages not handled by the specific receiver
    }
}
