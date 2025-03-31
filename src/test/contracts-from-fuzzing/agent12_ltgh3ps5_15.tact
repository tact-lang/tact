message MyMessage {
    value: Int;
}

contract Test {
    // Fallback binary receiver
    receive(msg: Slice) {
        // Fallback for unmatched binary messages
    }
    
    // Typed binary message receiver
    receive(msg: MyMessage) {
        // Handles binary message of type MyMessage
    }
    
    // Arbitrary text receiver
    receive(msg: String) {
        // Handles arbitrary text messages
    }
    
    // Specific text receiver
    receive("specific") {
        // Handles text messages exactly equal to "specific"
    }
    
    // Empty message receiver
    receive() {
        // Handles empty messages
    }
}
