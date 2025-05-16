message MyMessage {
    data: Int;
}

contract Test {
    // Receiver Order Variation Test: Declare receivers in a non-standard order to verify that order does not affect message matching
    // According to documentation, order of declaration does not affect matching.

    receive(msg: Slice) {
        // Fallback for unmatched binary messages
    }

    receive("greeting") {
        // Specific text comment receiver
    }

    receive() {
        // Empty message receiver
    }

    receive(str: String) {
        // Arbitrary text message receiver
    }

    receive(msg: MyMessage) {
        // Typed binary message receiver
    }
}
