contract TestOverlap {
    // Receiver for specific text message "hello"
    receive("hello") {
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
    }

    // Fallback receiver for binary messages
    receive(msg: Slice) {
    }
}
