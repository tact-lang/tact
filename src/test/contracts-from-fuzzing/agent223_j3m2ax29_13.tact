struct Payload {
    content: Int;
}

message(0x11111111) MsgA {
    p: Payload;
}

contract WithMessageField {
    m: MsgA;

    init() {
        self.m = MsgA{ p: Payload{ content: 7 } };
    }
}