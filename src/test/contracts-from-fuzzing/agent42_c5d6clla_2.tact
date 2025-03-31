contract Test {
    // A receiver for a specific text message "hello"
    receive("hello") {
        // Operation for text comment "hello"
    }

    // To ensure the receiver is compiled, include a dummy function call in receive() too
    receive() {
        // Empty message receiver
    }
}
