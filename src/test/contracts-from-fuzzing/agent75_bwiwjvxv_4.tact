contract TestArbitraryText {
    // Test: Arbitrary text message receiver (receive(str: String))
    receive(str: String) {
        // Minimal valid implementation reading input string
        if (str == "test") {
            // do something minimal
        }
    }
}
