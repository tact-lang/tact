contract Test7 {
    // This contract tests overlapping text message receivers: literal and arbitrary text.
    // The receiver for a specific comment "hello" should have higher priority than an arbitrary string receiver.
    receive("hello") {
        // Specific comment receiver logic
    }

    receive(str: String) {
        // Arbitrary text receiver logic
    }
}
