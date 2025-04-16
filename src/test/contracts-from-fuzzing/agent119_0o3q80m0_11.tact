contract Test {
    // Specific text receiver for the comment "hello"
    receive("hello") {
        // do nothing
    }
    
    // Arbitrary text receiver for all other text messages
    receive(str: String) {
        // do nothing
    }
}
