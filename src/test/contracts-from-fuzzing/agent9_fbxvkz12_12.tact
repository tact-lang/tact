contract Test {
    // Receiver for empty messages
    receive() {
        // Handle empty message
    }
    
    // Receiver for specific text messages
    receive("hello") {
        // Handle message: "hello"
    }
    
    // Receiver for arbitrary text messages
    receive(str: String) {
        // Handle any text message not matching a specific text
    }
    
    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // Handle binary message
    }
}
