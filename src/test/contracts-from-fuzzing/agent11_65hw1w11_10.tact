contract Test {
    // Receiver for empty message
    receive() {
        // Process empty message
    }

    // Receiver for specific text literal
    receive("hello") {
        // Process message with text literal "hello"
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Process any text message
    }

    // Receiver for fallback binary messages
    receive(msg: Slice) {
        // Process unmatched binary message
    }
}
