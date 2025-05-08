message MyMsg {
    x: Int;
}

contract Test {
    // Receiver for empty messages
    receive() {
        return;
    }

    // Receiver for specific literal text "hello"
    receive("hello") {
        return;
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        return;
    }

    // Receiver for typed binary message
    receive(msg: MyMsg) {
        return;
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        return;
    }
}
