message MyMessage {
    value: Int;
}

contract Test {
    matched: Int = 0;

    // Receiver for unmatched binary messages (fallback)
    receive(msg: Slice) {
        self.matched = 5;
    }

    // Receiver for typed binary messages
    receive(msg: MyMessage) {
        self.matched = 4;
    }

    // Receiver for arbitrary string messages
    receive(s: String) {
        self.matched = 3;
    }

    // Receiver for specific text comment "specific"
    receive("specific") {
        self.matched = 2;
    }

    // Receiver for empty messages
    receive() {
        self.matched = 1;
    }
}
