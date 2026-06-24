message MyMsg {
    value: Int;
}

contract Test {
    // Receiver for fallback binary messages
    receive(msg: Slice) {
        // Fallback handler for binary messages
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Handler for arbitrary text messages
    }

    // Receiver for literal text message "hello"
    receive("hello") {
        // Handler for exact "hello" comment
    }

    // Receiver for empty messages
    receive() {
        // Handler for empty messages
    }

    // Receiver for typed binary messages using custom message type
    receive(msg: MyMsg) {
        // Handler for MyMsg messages
    }
}
