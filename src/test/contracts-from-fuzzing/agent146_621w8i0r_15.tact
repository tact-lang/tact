message MyMsg {
    a: Int;
}

contract TestReceiverOrder {
    order: String = "";

    // Empty message receiver
    receive() {
        self.order = "empty";
    }

    // Specific text message receiver
    receive("hello") {
        self.order = "literal";
    }

    // Arbitrary text message receiver
    receive(str: String) {
        self.order = "arbitrary";
    }

    // Typed binary message receiver
    receive(msg: MyMsg) {
        self.order = "typed";
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        self.order = "fallback";
    }

    get fun getOrder(): String {
        return self.order;
    }
}
