message MyMsg {
    a: Int;
}

contract Test {
    // Test 13: Declaring receivers in non-documented order, which should behave identically to declared order

    // Arbitrary text receiver
    receive(str: String) {
        // This should catch all text messages not matching specific comments
    }

    // Empty message receiver
    receive() {
        // Processing empty messages
    }

    // Specific text comment receiver
    receive("increment") {
        // This should only be triggered when the comment exactly matches "increment"
    }

    // Typed binary message receiver
    receive(msg: MyMsg) {
        // Processes messages of type MyMsg
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback handler for binary messages
    }
}
