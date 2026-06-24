message MyMessage {
    value: Int;
}

contract Test {
    state: Int;

    init() {
        self.state = 0;
    }

    // Handler for empty messages
    receive() {
        self.state = 1;
    }

    // Handler for messages with specific comment "hello"
    receive("hello") {
        self.state = 2;
    }

    // Handler for arbitrary text messages
    receive(str: String) {
        self.state = 3;
    }

    // Handler for typed binary messages matching MyMessage
    receive(msg: MyMessage) {
        self.state = 4;
    }

    // Fallback handler for all unmatched binary messages
    receive(msg: Slice) {
        self.state = 5;
    }
}
