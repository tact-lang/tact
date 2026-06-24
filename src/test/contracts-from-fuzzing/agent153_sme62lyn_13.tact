contract Test {
    // Comprehensive contract with various receiver types to test matching prioritization
    
    // 1. Empty message receiver
    receive() {
        // Handle empty messages
    }

    // 2. Specific text comment receiver for message "specific"
    receive("specific") {
        // Handle message with comment "specific"
    }

    // 3. Arbitrary text receiver capturing any text message
    receive(str: String) {
        // Handle any text message
    }

    // 4. Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback for binary messages
    }
}
