contract Test {
    // Test matching prioritization: specific text receiver vs arbitrary text receiver
    // According to documentation, a message with the comment "hello" should be caught by the text literal receiver
    receive("hello") {
    }
    
    receive(str: String) {
    }
}
