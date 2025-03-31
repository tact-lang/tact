message MyMsg {
    a: Int;
}

contract Test {
    // Receiver for a fixed text comment (should match messages with comment "hello")
    receive("hello") {
        // fixed text receiver
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // fallback binary receiver
    }

    // Receiver for empty messages
    receive() {
        // empty message receiver
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // arbitrary text receiver
    }

    // Receiver for typed binary messages
    receive(msg: MyMsg) {
        // typed binary message receiver
    }
}
