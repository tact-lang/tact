message MyMessage {
    value: Int;
}

contract Test {
    // 1. Receiver for empty messages
    receive() {
        // Handle empty message
    }

    // 2. Receiver for specific text messages
    receive("hello") {
        // Handle message with comment exactly "hello"
    }

    // 3. Receiver for arbitrary text messages
    receive(str: String) {
        // Handle any text message not matching exact comment receivers
    }

    // 4. Receiver for typed binary messages
    receive(msg: MyMessage) {
        // Handle binary message of type MyMessage
    }

    // 5. Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback handler
    }
}
