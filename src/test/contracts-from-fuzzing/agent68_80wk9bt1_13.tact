message MyMsg {
    value: Int;
}

contract Test {
    // Valid combination of all internal receiver types
    receive() {
        // empty message receiver
    }

    receive("hello") {
        // specific text receiver
    }

    receive(str: String) {
        // arbitrary text receiver
    }

    receive(msg: MyMsg) {
        // typed binary receiver
    }

    receive(msg: Slice) {
        // fallback receiver for all unmatched binary messages
    }
}
