message MyMsg {
    x: Int;
}

contract Test {
    output: String = "";

    // Receiver for empty messages
    receive() {
        self.output = "empty";
    }

    // Receiver for specific text messages
    receive("test") {
        self.output = "specific";
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        self.output = str;
    }

    // Receiver for typed binary messages
    receive(msg: MyMsg) {
        self.output = "typed";
    }

    // Fallback binary receiver for all unmatched binary messages
    receive(msg: Slice) {
        self.output = "fallback";
    }
}
