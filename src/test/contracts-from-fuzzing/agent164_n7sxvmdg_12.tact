contract Test {
    last: String = "";
    
    // Specific comment text receiver for 'world'
    receive("world") {
        self.last = "specific world";
    }
    
    // General arbitrary text receiver
    receive(str: String) {
        self.last = str;
    }
    
    // Fallback empty receiver (used for non-text messages or unmatched cases)
    receive() {}
}
