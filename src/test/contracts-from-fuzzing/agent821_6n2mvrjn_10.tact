message(1) Msg1 {}
message(2) Msg2 {}

struct ManyMsgs {
    m1: Msg1;
    m2: Msg2;
    optM1: Msg1?;
    optM2: Msg2?;
}

contract TestMsgs {
    data: ManyMsgs;

    init() {
        self.data = ManyMsgs{
            m1: Msg1{},
            m2: Msg2{},
            optM1: null,
            optM2: null,
        };
    }
}