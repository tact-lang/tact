message MyMsg {
    value: Int;
}

contract Test {
    // Fallback receiver for all unmatched binary messages using Slice parameter
    receive(msg: Slice) {
        // Empty body
    }

    // Receiver for a specific text message
    receive("hello") {
        // Empty body
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Empty body
    }

    // Receiver for empty messages
    receive() {
        // Empty body
    }

    // Receiver for typed binary messages using a declared message type
    receive(msg: MyMsg) {
        let x = msg.value;
    }
}
