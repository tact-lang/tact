contract Test {
    // Dynamic text receiver appears first
    receive(s: String) {
        // This should handle any arbitrary text messages
    }

    // Literal text receiver for exact comment "hello"
    receive("hello") {
        // This receiver should match only when the message comment is exactly "hello"
    }

    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // Fallback binary messages
    }
}
