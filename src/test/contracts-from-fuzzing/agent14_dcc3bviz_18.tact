message MsgA {
    x: Int
}

contract TestSwappedReceiverOrder {
    // Receivers declared in non-documented order to verify that declaration order does not affect matching

    // Fallback binary message receiver (should act as last resort)
    receive(msg: Slice) {
        // Fallback
    }

    // Arbitrary text receiver
    receive(str: String) {
        // Arbitrary text receiver
    }

    // Specific text receiver for "test"
    receive("test") {
        // Specific text literal receiver
    }

    // Binary typed message receiver
    receive(msg: MsgA) {
        // Typed binary message receiver
        let _ = msg.x;
    }

    // Empty receiver
    receive() {
        // Empty message receiver
    }
}
