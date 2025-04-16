contract Test {
    // Literal text receiver for exact comment "hello"
    receive("hello") {
        // literal matching
    }

    // Dynamic text receiver for any text message
    receive(s: String) {
        // dynamic text matching
    }

    // Fallback binary receiver for any unmatched binary data
    receive(msg: Slice) {
        // fallback handling
    }
}
