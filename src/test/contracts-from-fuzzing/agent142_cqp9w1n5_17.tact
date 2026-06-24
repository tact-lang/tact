contract Test {
    // Two literal text receivers with similar but distinct strings
    receive("hello") {
        // Handle message exactly "hello"
    }
    
    receive("hello ") {
        // Handle message exactly "hello " (with space)
    }

    // Arbitrary text receiver, acting as catch-all for any text
    receive(str: String) {
        // Handle other text messages
    }

    // Fallback binary message receiver
    receive(msg: Slice) {
        // Handle binary messages not matching typed ones
    }
}
