contract Test {
    state: Int = 0;
    
    // Fallback receiver for binary messages
    receive(msg: Slice) {
        // For testing, we'll just update the state
        self.state = 999;
    }

    // Dummy receiver to ensure contract compiles fully
    receive() { }
}
