contract TestPriority {
    result: Int = 0;
    
    // Receiver for specific text "exact" should match messages with comment "exact"
    receive("exact") {
        self.result = 10;
    }
    
    // Receiver for empty messages
    receive() {
        self.result = 1;
    }
    
    // Receiver for arbitrary text messages
    receive(str: String) {
        self.result = 20;
    }
    
    // Fallback receiver for binary messages (Slice)
    receive(msg: Slice) {
        self.result = 30;
    }
}
