message MyMessage {
    value: Int;
}

contract ReceiverOrderTest {
    // State variable to track which receiver was triggered
    r: Int = -1;

    // Receiver intended for binary messages with unknown types (fallback)
    receive(msg: Slice) {
        self.r = 4; // fallback
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        self.r = 3; // text receiver
    }

    // Receiver for empty messages
    receive() {
        self.r = 1; // empty message receiver
    }

    // Receiver for specific text messages: "hello"
    receive("hello") {
        self.r = 2; // specific text match
    }

    // Receiver for typed binary message
    receive(msg: MyMessage) {
        self.r = msg.value; // typed message
    }

    // Getter to observe state (for testing purposes)
    get fun get_r(): Int {
        return self.r;
    }
}
