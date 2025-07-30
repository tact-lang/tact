contract Test {
    // Receivers declared in non-documented order to verify matching behavior is independent of declaration order
    receive(msg: Slice) {
        // Fallback for unmatched binary messages
    }
    receive("text") {
        // Specific text message receiver
    }
    receive(str: String) {
        // Arbitrary text message receiver
    }
}
