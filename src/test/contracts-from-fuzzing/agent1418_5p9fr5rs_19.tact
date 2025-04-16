struct MsgA {
    kind: Int;
}

struct MsgB {
    a: Int;
    b: MsgA;
    optA: MsgA?;
}

contract MsgFields {
    f: MsgB;

    init() {
        self.f = MsgB{
            a: 1,
            b: MsgA{ kind: 2 },
            optA: null,
        };
    }
}