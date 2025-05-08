contract Test7 {
    receive("abc") {
        // Specific text receiver for "abc"
    }

    receive(msg: String) {
        // Arbitrary text receiver for any text message
    }

    receive(msg: Slice) {
        // Fallback binary receiver for all unmatched binary messages
    }
}
