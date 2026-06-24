contract TestContract {
    // Multiple receivers to verify matching order
    receive() {
        // Empty message receiver
    }
    
    receive("message") {
        // Specific text literal receiver
    }
    
    receive(str: String) {
        // Arbitrary text receiver
    }
    
    receive(msg: Slice) {
        // Fallback receiver for unmatched binary messages
    }
}
