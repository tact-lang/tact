message MyMsg {
    v: Int;
}

contract OrderingTest {
    // Fallback binary receiver declared first
    receive(msg: Slice) {
        // Fallback
    }

    // Empty message receiver declared second
    receive() {
        // Handles empty messages
    }

    // Specific text message receiver, matching "ping"
    receive("ping") {
        // Handles "ping" messages
    }

    // Arbitrary text message receiver
    receive(str: String) {
        // Handles arbitrary text messages
    }

    // Typed binary message receiver
    receive(msg: MyMsg) {
        // Processes MyMsg; using msg.v to avoid unused variable warning
        let _ = msg.v + 0;
    }
}
