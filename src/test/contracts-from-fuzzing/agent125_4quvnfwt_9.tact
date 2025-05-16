contract Test {
    // Literal text receiver for comment "hello"
    receive("hello") { 
        // literal match
    }
    
    // Dynamic text receiver for any string message
    receive(str: String) {
        // dynamic text match
    }
    
    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) { 
        // fallback handling
    }
}
