contract Test9 {
    // Test 9: Prioritization between specific text receiver and generic text receiver.
    // According to documentation, a message with text "hello" should be handled by the specific receiver receive("hello") and not the generic receive(str: String).
    
    receive("hello") {
        // Specific handler for exactly "hello"
    }

    receive(str: String) {
        // Generic text handler
    }
}
