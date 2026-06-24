message MyMessage {
    value: Int;
}

contract Test {
    // Out-of-order receiver declarations to verify matching priority does not depend on declaration order
    receive(str: String) {
        // This should handle arbitrary text messages EXCEPT those with specific text matching later
    }
    
    receive() {
        // This should handle empty messages
    }
    
    receive(msg: Slice) {
        // Fallback binary handler for unmatched binary messages
    }
    
    receive("text") {
        // Specific text message handler; messages with comment "text" should match this
    }
    
    receive(msg: MyMessage) {
        // Handler for binary message of type MyMessage
    }
}
