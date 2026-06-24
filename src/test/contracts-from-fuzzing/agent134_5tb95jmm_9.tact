message MyMsg {
    x: Int;
}

contract TestOrder {
    empty_called: Bool = false;
    text_called: Bool = false;
    string_called: Bool = false;
    typed_called: Bool = false;
    fallback_called: Bool = false;

    // 1. Empty message receiver
    receive() {
        self.empty_called = true;
    }

    // 2. Specific text comment receiver
    receive("hello") {
        self.text_called = true;
    }

    // 3. Arbitrary text receiver
    receive(str: String) {
        self.string_called = true;
    }

    // 4. Typed binary message receiver
    receive(msg: MyMsg) {
        self.typed_called = true;
    }

    // 5. Fallback binary message receiver
    receive(msg: Slice) {
        self.fallback_called = true;
    }
}
