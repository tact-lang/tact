contract TestOrder {
    // Test I: Receiver matching order test
    // Defined receivers according to documented matching order:
    // 1. receive() for empty messages
    // 2. receive("message") for specific text messages
    // 3. receive(str: String) for arbitrary text messages
    // 4. receive(msg: Slice) as fallback for unmatched binary messages
    
    receive() {
        // Handler for empty messages
    }

    receive("message") {
        // Specific text receiver; should match exact "message"
    }

    receive(str: String) {
        // Arbitrary text receiver; will be used unless specific text receiver matches
    }

    receive(msg: Slice) {
        // Fallback receiver for binary messages
    }
}
