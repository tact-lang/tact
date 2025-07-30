message MyMessage {
    a: Int;
}

contract Test {
    // 1. Receiver for empty messages
    receive() {
        // handle empty message
    }

    // 2. Receiver for specific text comment "hello"
    receive("hello") {
        // handle text "hello"
    }

    // 3. Receiver for arbitrary text messages
    receive(s: String) {
        // handle arbitrary text message
    }

    // 4. Receiver for binary messages of type MyMessage
    receive(msg: MyMessage) {
        // handle typed binary message
    }

    // 5. Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // fallback handler
    }
}
