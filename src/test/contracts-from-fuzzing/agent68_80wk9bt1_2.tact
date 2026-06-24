contract Test {
    // Receiver for a specific text comment: exactly "hello"
    receive("hello") {
        // action for hello message
    }
    
    // Fallback receiver: accepts unmatched binary messages
    receive(msg: Slice) {
        // action for fallback message
    }
}
