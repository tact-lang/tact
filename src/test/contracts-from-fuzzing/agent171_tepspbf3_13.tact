contract Test {
    // Receiver for exact literal text "test"
    receive("test") {
    }

    // Parameterized receiver for arbitrary text messages
    receive(msg: String) {
        let a: String = msg;
    }

    // Fallback receiver for binary messages (Slice)
    receive(msg: Slice) {
        let b: Slice = msg;
    }

    // Empty receiver for empty messages
    receive() {
    }
}
