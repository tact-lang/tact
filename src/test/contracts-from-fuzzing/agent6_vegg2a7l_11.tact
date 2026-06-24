message MyMsg {
    a: Int;
}

contract Test {
    // Receiver for typed binary messages
    receive(msg: MyMsg) {
        // handler for typed messages
    }

    // Receiver for arbitrary text messages; underscore to discard parameter
    receive(_ : String) {
        // handler for arbitrary text
    }

    // Literal text receiver
    receive("literal") {
        // handler for literal text message "literal"
    }

    // Empty message receiver
    receive() {
        // handler for empty messages
    }

    // Fallback receiver for all unmatched binary messages
    receive(_: Slice) {
        // fallback handler
    }
}
