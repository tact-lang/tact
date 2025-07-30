contract TestOverlapping {
    matched: Int = 0;

    // This receiver should catch messages with no body (empty messages)
    receive() {
        self.matched = 3;
    }

    // This receiver should catch messages with specific text "message"
    receive("message") {
        self.matched = 1;
    }

    // This receiver should catch arbitrary text messages that don't match a specific text
    receive(str: String) {
        self.matched = 2;
    }

    // This receiver should be the fallback for binary messages
    receive(msg: Slice) {
        self.matched = 4;
    }
}
