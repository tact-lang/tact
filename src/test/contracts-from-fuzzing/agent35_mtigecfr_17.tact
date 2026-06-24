message MyTyped {
    value: Int;
}

contract Test {
    // Testing mixed declaration order for receivers; note that the order of declaration should have no effect on message matching
    receive("special") {
        // Specific text message receiver
    }

    receive(msg: Slice) {
        // Fallback receiver for unmatched binary messages
    }

    receive() {
        // Empty message receiver
    }

    receive(msg: MyTyped) {
        // Typed binary message receiver
        let dummy = msg.value;
    }

    receive(str: String) {
        // Arbitrary text message receiver
    }
}
