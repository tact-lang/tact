message(0x1) M1 {
    a: Int;
}

message(0x2) M2 {
    b: Bool;
}

struct Both {
    m1: M1;
    m2: M2;
}

contract MsgNested {
    v: Both;

    init() {
        self.v = Both{
            m1: M1{a: 5},
            m2: M2{b: true}
        };
    }
}
