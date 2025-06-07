message MyMsg {
    value: Int;
}

contract TestAllReceivers {
    // This contract declares all forms of receiver functions in a non-standard order to test that ordering does not affect message processing.

    // Fallback binary receiver
    receive(msg: Slice) {
        // Process unmatched binary messages
    }

    // Specific text message receiver
    receive("hi") {
        // Process text message with comment "hi"
    }

    // Empty message receiver
    receive() {
        // Process empty messages
    }

    // Arbitrary text message receiver
    receive(str: String) {
        // Process any text message
    }

    // Typed binary message receiver
    receive(msg: MyMsg) {
        // Process binary message with structure MyMsg
        if (msg.value > 0) {}
    }
}
