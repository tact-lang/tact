message MyMsg {
    value: Int;
}

contract TestAllReceivers {
    // 1. Empty message receiver
    receive() {
        // Handler for empty messages
    }

    // 2. Specific text receiver for "hello"
    receive("hello") {
        // Handler for text comment "hello"
    }

    // 3. Arbitrary text receiver
    receive(str: String) {
        // Handler for any text message
    }

    // 4. Typed binary receiver
    receive(msg: MyMsg) {
        // Handler for messages of type MyMsg
    }

    // 5. Fallback binary receiver
    receive(msg: Slice) {
        // Handler for any binary message not caught by prior receivers
    }
}
