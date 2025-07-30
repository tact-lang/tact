message MyMsg {
    a: Int;
}

contract MultiReceiverTest {
    // Receiver for typed binary message
    receive(msg: MyMsg) {
        // handles typed binary messages
    }

    // Empty message receiver
    receive() {
        // handles empty messages
    }

    // Specific text comment receiver
    receive("specific") {
        // handles messages with the exact comment "specific"
    }

    // Arbitrary text message receiver
    receive(str: String) {
        // handles arbitrary text messages
    }

    // Fallback binary message receiver
    receive(msg: Slice) {
        // handles all unmatched binary messages
    }
}
