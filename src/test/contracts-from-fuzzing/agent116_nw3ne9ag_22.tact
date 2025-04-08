contract MsgInMsgNested {
    foo: MsgA;

    init() {
        self.foo = MsgA{
            b: MsgB{
                c: StructC{ val: 9 },
                y: 2
            },
            x: 1
        };
    }
}

message MsgA {
    b: MsgB;
    x: Int;
}

message MsgB {
    c: StructC;
    y: Int;
}

struct StructC {
    val: Int;
}
