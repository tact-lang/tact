contract Test {
    // Empty message receiver
    receive() {
    }
    
    // Specific text receiver
    receive("hello") {
    }
    
    // Arbitrary text receiver
    receive(msg: String) {
    }
    
    // Fallback binary receiver
    receive(msg: Slice) {
    }
}
