contract Test {
    // Test 14: Receiver matching order between text-specific and arbitrary text receiver
    // According to the documentation, textual messages with comment "greet" should match the text-specific receiver
    receive("greet") {
        // Specific match
    }
    
    receive(str: String) {
        // Arbitrary text receiver
    }

    // Dummy receive for binary fallback testing
    // This always gets matched if binary message is not caught
    receive(msg: Slice) {
        // Fallback for binary messages
    }
}
