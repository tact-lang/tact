message(0x55) MsgA {a: Int}
message(0x66) MsgB {b: Int}

struct Holder {
    m1: MsgA;
    m2: MsgB;
}

contract HoldMsgs {
    h: Holder;

    init() {
        self.h = Holder{ m1: MsgA{a:1}, m2: MsgB{b:2} };
    }
}
