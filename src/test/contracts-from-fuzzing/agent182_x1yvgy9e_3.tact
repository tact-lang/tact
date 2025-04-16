contract Test {
    // Test receive(String): handles arbitrary text messages
    receive(str: String) { 
        // simple handler
    }

    // Fallback receiver to ensure contract compiles
    receive() { }
}