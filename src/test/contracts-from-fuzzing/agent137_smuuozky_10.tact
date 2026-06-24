contract TestReceiverPriority {
    // This contract has multiple receiver types to test matching prioritization
    // 1. Fixed text "hello"
    receive("hello") {
        // matched if exact "hello"
    }
    
    // 2. Arbitrary text messages
    receive(str: String) {
        // matched if message is text but not exactly "hello"
    }
    
    // 3. Fallback for binary messages
    receive(msg: Slice) {
        // fallback receiver
    }
}
