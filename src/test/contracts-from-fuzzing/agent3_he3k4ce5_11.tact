message A {
    x: Int;
}

message MyMsg {
    y: Int;
}

contract Test {
    // Fallback receiver for binary messages
    receive(msg: Slice) {
        // Fallback binary
    }

    // Empty message receiver
    receive() {
        // Empty message
    }

    // Specific text receiver
    receive("hello") {
        // Specific text receiver
    }

    // Fallback receiver for arbitrary text messages
    receive(str: String) {
        // Arbitrary text receiver
    }

    // Receiver for typed binary message of type A
    receive(msg: A) {
        // Typed message A
    }

    // Receiver using underscore to discard parameter for typed binary message MyMsg
    receive(_: MyMsg) {
        // Typed message MyMsg (parameter discarded)
    }
}
