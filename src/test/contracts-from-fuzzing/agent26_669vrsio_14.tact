message MyMsg {
    a: Int;
}

contract TestReceiverAll {
    // Declaring receivers in a non-standard order to test that declaration order has no effect
    receive("msg") {
        // Specific text receiver
    }

    receive() {
        // Empty message receiver
    }

    receive(msg: Slice) {
        // Fallback receiver for unmatched binary messages
    }

    receive(str: String) {
        // Arbitrary text message receiver
    }

    receive(msg: MyMsg) {
        // Typed binary message receiver
    }
}
