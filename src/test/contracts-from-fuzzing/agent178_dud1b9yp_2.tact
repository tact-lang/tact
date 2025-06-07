contract Test {
    state: Int = 0;
    
    // Receiver for specific text message "hello"
    receive("hello") {
        self.state = 42;
    }
    
    // Fallback receiver handles unmatched messages (empty messages fallback)
    receive(msg: Slice) {
        self.state = -1;
    }
}
