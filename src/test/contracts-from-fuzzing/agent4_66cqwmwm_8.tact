contract TestReceiverOrder {
    receive("hello") {
        // Specific text receiver; should match input "hello"
    }
    
    receive(str: String) {
        // Generic text receiver; should match any text not caught by literal
    }
    
    receive(msg: Slice) {
        // Fallback binary receiver; should only match binary messages
    }
}
