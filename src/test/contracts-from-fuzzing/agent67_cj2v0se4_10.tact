message MyMsg {
    value: Int;
}

contract Test {
    // Arbitrary text receiver, should match any non-empty text
    receive(str: String) {
        // arbitrary text message handler
    }

    // Specific text literal receiver: for messages that are exactly "hello"
    receive("hello") {
        // specific text receiver
    }

    // Empty message receiver: for messages with no attached data
    receive() {
        // empty message handler
    }

    // Typed binary receiver for a message of type MyMsg
    receive(msg: MyMsg) {
        // typed binary message handler
    }

    // Fallback receiver: for any unmatched binary message
    receive(msg: Slice) {
        // fallback handler
    }
}
