message TestMsg {
    a: Int;
}

contract Test {
    // Arbitrary text message receiver, referring to a helper function to simulate stateful use
    receive(str: String) {
        self.helper();
    }
    
    // Empty message receiver
    receive() {
        // intentionally empty
    }
    
    // Literal text receiver - literal "hello"
    receive("hello") {
        // process literal message
    }
    
    // Fallback binary receiver
    receive(msg: Slice) {
        // process unmatched binary messages
    }
    
    // Helper function referenced above
    fun helper() {
    }
}
