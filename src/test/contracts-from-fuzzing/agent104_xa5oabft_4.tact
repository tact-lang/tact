message MyMsg {
    value: Int;
}

contract Test {
    // Out-of-order receiver declarations to test nondeterministic declaration order
    receive(str: String) {
        // Arbitrary text message receiver
    }
    receive() {
        // Empty message receiver
    }
    receive(msg: MyMsg) {
        // Typed message receiver
    }
    receive("hello") {
        // Specific text receiver
    }
    receive(msg: Slice) {
        // Fallback receiver for unmatched binary messages
    }
}
