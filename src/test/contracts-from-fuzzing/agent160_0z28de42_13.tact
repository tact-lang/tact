contract Test {
    // Conflicting/overlapping message patterns test
    // This contract declares both a specific text receiver and an arbitrary text receiver.
    // According to the documentation, if a message with text "greeting" is received,
    // the specific text receiver (receive("greeting")) must be chosen over receive(str: String).
    
    receive("greeting") {
        // Specific text handler
    }

    receive(str: String) {
        // Arbitrary text handler
    }
}
