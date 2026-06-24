contract Test {
    // Test for two literal receivers with different capitalization
    // Expectation: They are considered distinct because the matching is case-sensitive
    receive("Hello") {
        // handler for "Hello"
    }

    receive("hello") {
        // handler for "hello"
    }

    // Fallback receiver for other binary messages
    receive(msg: Slice) {}
}
