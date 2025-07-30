contract Test {
    // Contract without a fallback receiver (receive(msg: Slice))
    // It only declares receivers for specific text and arbitrary text messages
    receive("special") {
        // Handler for messages with the specific comment "special"
    }
    
    receive(str: String) {
        // Handler for arbitrary text messages
    }

    // Also include an empty receiver for empty messages
    receive() {
        // Handler for empty messages
    }
}
