message MyMsg {
    value: Int;
}

contract AllReceivers {
    counterEmpty: Int = 0;
    counterText: Int = 0;
    lastStr: String = "";
    typed: Int = 0;
    fallback: Int = 0;

    // Empty message receiver
    receive() {
        self.counterEmpty = self.counterEmpty + 1;
    }

    // Specific text receiver for "text"
    receive("text") {
        self.counterText = self.counterText + 1;
    }

    // Arbitrary text receiver with String parameter
    receive(str: String) {
        self.lastStr = str;
    }

    // Typed binary message receiver
    receive(msg: MyMsg) {
        self.typed = msg.value;
    }

    // Fallback receiver for any binary message (Slice)
    receive(msg: Slice) {
        self.fallback = self.fallback + 1;
    }
}
