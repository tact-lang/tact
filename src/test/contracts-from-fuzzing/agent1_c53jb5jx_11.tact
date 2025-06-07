// Test having multiple receive functions for different message types
message MsgA { a: Int; }
message MsgB { b: Bool; }

contract MultiReceiver {
    valA: Int;
    valB: Bool;

    init() {
        self.valA = 0;
        self.valB = false;
    }

    receive(msg: MsgA) {
        self.valA = msg.a;
    }

    receive(msg: MsgB) {
        self.valB = msg.b;
    }
}
