contract TestFallback {
    result: Int = 0;
    
    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        self.result = 999;
    }
}
