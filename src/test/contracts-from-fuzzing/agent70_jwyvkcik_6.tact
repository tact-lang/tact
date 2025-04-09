contract Test {
    // Overlapping receivers: literal, arbitrary text, fallback
    receive("hello") {
        // literal text receiver
    }

    receive(msg: String) {
        // arbitrary text receiver
    }

    receive(msg: Slice) {
        // fallback for binary messages
    }
}
