message(0x1) MsgOne { a: Int }
message(0x2) MsgTwo { b: Int }

struct MultiMessageHold {
    m1: MsgOne;
    m2: MsgTwo;
}

contract ManyMsgsFields {
    val: MultiMessageHold;
    init() {
        self.val = MultiMessageHold{
            m1: MsgOne{a:1},
            m2: MsgTwo{b:2}
        };
    }
}