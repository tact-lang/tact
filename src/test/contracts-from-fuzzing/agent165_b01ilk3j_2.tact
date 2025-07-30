contract Test {
    // Specific receiver for message comment "hello"
    receive("hello") {
        // Handler for exact message "hello"
    }

    // Fallback receiver to ensure message matching works
    receive(msg: Slice) {
        // Fallback handler for any binary message
    }
}
