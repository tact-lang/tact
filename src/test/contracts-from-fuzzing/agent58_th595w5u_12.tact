contract Test13 {
    // This contract has 4 distinct receivers covering all valid patterns:
    // 1. Empty message receiver
    receive() {
        // Handles empty messages
    }
    
    // 2. Specific literal text receiver
    receive("text") {
        // Handles messages exactly equal to "text"
    }
    
    // 3. Arbitrary string receiver
    receive(str: String) {
        // Handles any text messages
    }
    
    // 4. Fallback binary message receiver
    receive(msg: Slice) {
        // Handles all unmatched binary messages
    }
    
    // Dummy function to ensure full compilation
    get fun dummy(): Int {
        return 13;
    }
}
