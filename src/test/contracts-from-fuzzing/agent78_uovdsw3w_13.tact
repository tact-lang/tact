contract TestOverlap {
    // Specific text receiver should catch messages with comment "hello"
    receive("hello") {
        // no-op
    }

    // Arbitrary text receiver for all other string messages
    receive(str: String) {
        // no-op
    }
}
