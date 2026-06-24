contract Test {
    // Ambiguous matching test: specific comment receiver and arbitrary text receiver in one contract
    receive("hello") {
        // This receiver should handle the literal comment "hello"
    }

    receive(str: String) {
        // This receiver should handle arbitrary text messages
    }

    receive(msg: Slice) {
        // Fallback receiver for unmatched binary messages
    }
}
