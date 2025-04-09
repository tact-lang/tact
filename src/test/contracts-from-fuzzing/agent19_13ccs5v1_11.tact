message MyMessage {
    a: Int;
}

contract Test {
    // Receives empty messages
    receive() {
        // Handler for empty internal messages
    }
    
    // Receives text messages with the exact comment "special"
    receive("special") {
        // Handler for specific text messages
    }
    
    // Receives any arbitrary text messages
    receive(str: String) {
        // Handler for arbitrary text messages
    }
    
    // Receives binary messages of type MyMessage
    receive(msg: MyMessage) {
        // Handler for typed binary messages
    }
    
    // Fallback receiver for all other binary messages
    receive(msg: Slice) {
        // Fallback handler for unknown binary messages
    }
}
