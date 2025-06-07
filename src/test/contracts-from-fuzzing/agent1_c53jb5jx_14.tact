// Re-test: Message field without explicit serialization format
message MsgA { a: Int; } // Field 'a' lacks explicit serialization 'as ...'

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
        self.valA = msg.a;
    }
}
