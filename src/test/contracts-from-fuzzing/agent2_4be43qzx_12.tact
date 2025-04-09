message MyMsg {
    value: Int;
}

contract TestMixed {
    emptyCount: Int = 0;
    helloCount: Int = 0;
    stringMsg: String = "";
    typedValue: Int = 0;
    fallbackCount: Int = 0;

    // Fallback receiver: receives any binary message not matching other receivers
    receive(msg: Slice) {
        self.fallbackCount = self.fallbackCount + 1;
    }

    // Receiver for arbitrary string messages
    receive(str: String) {
        self.stringMsg = str;
    }

    // Receiver for specific text comment "hello"
    receive("hello") {
        self.helloCount = self.helloCount + 1;
    }

    // Receiver for empty messages
    receive() {
        self.emptyCount = self.emptyCount + 1;
    }

    // Receiver for typed binary messages of type MyMsg
    receive(msg: MyMsg) {
        self.typedValue = msg.value;
    }
}
