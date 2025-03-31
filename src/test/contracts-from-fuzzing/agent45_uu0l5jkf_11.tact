message MyMsg {
    value: Int;
}

contract ReceiverPriority {
    x: Int = 0;

    // 1. Empty message receiver
    receive() {
        self.x = 1;
    }

    // 2. Specific text receiver for "hello" 
    receive("hello") {
        self.x = 2;
    }

    // 3. Arbitrary text receiver
    receive(str: String) {
        self.x = 3;
    }

    // 4. Typed binary message receiver
    receive(msg: MyMsg) {
        self.x = msg.value;
    }

    // 5. Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        self.x = 999;
    }
}
