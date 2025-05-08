message MsgA {
    field: Int;
}

message MsgB {
    field: Int;
}

contract Test {
    a: Int;
    b: Int;

    init() {
        self.a = 0;
        self.b = 0;
    }

    // Receiver for binary messages of type MsgA
    receive(msg: MsgA) {
        self.a = msg.field;
    }

    // Receiver for binary messages of type MsgB
    receive(msg: MsgB) {
        self.b = msg.field;
    }

    // Receiver for empty messages
    receive() {
        // No operation
    }
}
