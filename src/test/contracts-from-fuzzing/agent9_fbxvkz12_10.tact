contract Test {
    receive("hello") {
        // This receiver handles specific text "hello"
    }
    
    receive(str: String) {
        // This receiver handles arbitrary text messages that don't match a specific text receiver
    }
}
