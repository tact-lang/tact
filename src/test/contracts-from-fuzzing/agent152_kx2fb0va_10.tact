contract TestReceiverPriority {
    // Multiple receiver functions to test matching prioritization:
    // 1. receive() for empty messages
    // 2. receive("hello") for specific text comments
    // 3. receive(msg: String) for arbitrary text messages
    // 4. receive(msg: Slice) for all unmatched binary messages (fallback)
    
    receive() {
        // handles empty messages
    }
    
    receive("hello") {
        // handles specific text comment "hello"
    }
    
    receive(msg: String) {
        // handles arbitrary text messages that do not match literal receivers
    }
    
    receive(msg: Slice) {
        // fallback for binary messages
    }
}
