contract TestPriority {
    state: Int = 0;
    
    // Receiver for specific text comment "increment"
    receive("increment") {
        self.state = 1;
    }
    
    // Receiver for arbitrary text messages
    receive(str: String) {
        self.state = 2;
    }
    
    // Dummy receiver for empty messages
    receive() {}
}
