message(11) A {}
message(12) B {
    val: Int;
}

struct MsgNest {
    m1: A;
    m2: B;
}

contract NestedMsgs {
    state: MsgNest;

    init() {
        self.state = MsgNest{
            m1: A{},
            m2: B{ val:42 }
        };
    }
}
