message MyMessage {
    value: Int;
}

contract Test {
    matched: Int = 0;

    // Receiver for empty message
    receive() {
        self.matched = 1;
    }

    // Receiver for specific text comment "special"
    receive("special") {
        self.matched = 2;
    }

    // Receiver for any string message
    receive(s: String) {
        self.matched = 3;
    }

    // Receiver for typed binary message
    receive(msg: MyMessage) {
        self.matched = 4;
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        self.matched = 5;
    }
}
