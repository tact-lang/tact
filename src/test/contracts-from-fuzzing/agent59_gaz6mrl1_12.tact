contract Test {
    // Receiver for specific string "message"
    receive("message") {
        // specific handling
    }
    
    // Generic text receiver
    receive(str: String) {
        // generic handling
    }

    // Minimal empty receiver
    receive() {
        // handles empty messages
    }

    // Fallback binary receiver
    receive(msg: Slice) {
        // fallback handling
    }
}
