message MyMsg {
    x: Int;
}

contract Test {
    // Receiver for empty message
    receive() {
        // Handle empty message case
    }

    // Receiver for exact text message "hello"
    receive("hello") {
        // Handle exact text case
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Handle arbitrary text message
    }

    // Receiver for typed binary messages
    receive(msg: MyMsg) {
        // Typed binary message handler
        let y = msg.x;
    }

    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // Fallback handler
    }
}
