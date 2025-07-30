message MyMsg1 {
    a: Int;
}

message MyMsg2 {
    b: Int;
}

contract Test {
    // Typed receiver for MyMsg1
    receive(msg: MyMsg1) {
        // receiver for MyMsg1
    }

    // Typed receiver for MyMsg2
    receive(msg: MyMsg2) {
        // receiver for MyMsg2
    }

    // Empty message receiver
    receive() {
        // empty message receiver
    }

    // Arbitrary text message receiver
    receive(str: String) {
        // arbitrary text receiver
    }

    // Fixed text comment receiver for "test"
    receive("test") {
        // fixed text receiver
    }

    // Fallback binary receiver
    receive(msg: Slice) {
        // fallback receiver
    }
}
