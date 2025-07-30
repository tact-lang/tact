contract Test10 {
    // Out of order receiver declarations: declaration order does not affect matching
    receive(str: String) {
        // This receiver should catch arbitrary text messages
    }

    receive("hello") {
        // This receiver should catch messages exactly with comment "hello"
    }

    receive(msg: Slice) {
        // Fallback receiver for binary messages
    }
}
