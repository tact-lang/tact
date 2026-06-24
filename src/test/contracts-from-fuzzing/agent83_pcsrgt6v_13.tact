message MyMsg {
    a: Int;
}

contract AllReceivers {
    // Empty message receiver
    receive() {
        // Handle empty messages
    }

    // Specific text comment receiver
    receive("comment") {
        // Handle messages with comment "comment"
    }

    // Arbitrary text message receiver
    receive(str: String) {
        // Handle any text message
    }

    // Typed binary message receiver
    receive(msg: MyMsg) {
        // Handle binary messages of type MyMsg
    }

    // Fallback binary message receiver
    receive(msg: Slice) {
        // Handle any unmatched binary message
    }
}
