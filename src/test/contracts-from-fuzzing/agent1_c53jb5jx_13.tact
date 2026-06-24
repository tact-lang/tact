// Test having multiple receive functions, one empty and one typed
message MsgA { a: Int; }

contract MixedReceiver {
    valA: Int;
    receivedEmpty: Bool;

    init() {
        self.valA = 0;
        self.receivedEmpty = false;
    }

    receive() {
        self.receivedEmpty = true;
    }

    receive(msg: MsgA) {
        self.valA = msg.a; // Messages need serialization `as int32` or similar
    }
}
