message MyMsg {
    value: Int;
}

contract Test {
    state: Int = 0;

    // 1. Empty message receiver
    receive() {
        self.state += 1;
    }

    // 2. Specific text receiver
    receive("test") {
        self.state += 2;
    }

    // 3. Arbitrary text receiver
    receive(text: String) {
        self.state += 3;
    }

    // 4. Typed binary message receiver
    receive(msg: MyMsg) {
        self.state += msg.value;
    }

    // 5. Fallback receiver for unmatched binary messages
    receive(_: Slice) {
        self.state += 4;
    }
}
