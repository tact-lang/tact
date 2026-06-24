message MyMessage {
    a: Int;
}

contract Test {
    // All valid receivers declared in non-documented order; order should be irrelevant
    receive(msg: Slice) {
        // fallback binary receiver
    }
    receive("hello") {
        // specific text receiver
    }
    receive() {
        // empty message receiver
    }
    receive(str: String) {
        // arbitrary text receiver
    }
    receive(msg: MyMessage) {
        // typed binary receiver
    }
}
