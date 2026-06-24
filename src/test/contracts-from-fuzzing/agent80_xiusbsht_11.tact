message MyMsg {
    value: Int;
}

contract Test {
    // 1. Empty message receiver
    receive() {
        // Empty receiver
    }

    // 2. Literal text receiver
    receive("literal") {
        // Literal receiver for exact match "literal"
    }

    // 3. Arbitrary text message receiver
    receive(str: String) {
        // Generic text receiver
    }

    // 4. Typed binary message receiver
    receive(msg: MyMsg) {
        // Receiver for MyMsg typed binary messages
    }

    // 5. Fallback binary message receiver
    receive(msg: Slice) {
        // Fallback receiver for binary messages not matching earlier receivers
    }
}
