message(1) MsgA { val: Int }
message(2) MsgB { flag: Bool }

struct HoldsMessages {
    m1: MsgA;
    m2: MsgB;
    count: Int;
}

contract StructWithMsgs {
    data: HoldsMessages;

    init() {
        self.data = HoldsMessages{
            m1: MsgA{val: 7},
            m2: MsgB{flag: true},
            count: 42,
        };
    }
}