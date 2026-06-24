message MyMessage {
    val: Int;
}

contract TestReceiverAll {
    // Receivers for different message types, order in code does not affect matching
    // Fallback receiver: catches any unmatched binary message
    receive(msg: Slice) {
        let e = 4;
    }

    // Typed binary message receiver
    receive(msg: MyMessage) {
        let d = 3;
    }

    // Arbitrary text message receiver
    receive(str: String) {
        let c = 2;
    }

    // Specific text message receiver
    receive("specific") {
        let b = 1;
    }

    // Empty message receiver
    receive() {
        let a = 0;
    }
}
