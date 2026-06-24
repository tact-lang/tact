contract Test {
    receive("message") {
        // Exact text receiver for "message"
    }
    
    receive(str: String) {
        // Fallback text receiver for arbitrary strings
    }
}
