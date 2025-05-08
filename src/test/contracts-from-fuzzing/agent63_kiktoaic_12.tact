message MyMsg {
    value: Int;
}

contract TestAllReceiversPermutation {
    // Receivers declared in reverse order order to test that declaration order doesn't affect matching

    // Fallback binary receiver
    receive(msg: Slice) {
        // Fallback handler for any binary message not caught by prior receivers
    }

    // Typed binary receiver
    receive(msg: MyMsg) {
        // Handler for messages of type MyMsg
    }

    // Arbitrary text receiver
    receive(str: String) {
        // Handler for any text message
    }

    // Specific text receiver for "world"
    receive("world") {
        // Handler for specific text comment "world"
    }

    // Empty message receiver
    receive() {
        // Handler for empty messages
    }
}
