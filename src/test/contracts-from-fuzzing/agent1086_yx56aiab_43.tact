message(12) MS1 { foo: Int }
message(13) MS2 { bar: Int }

struct TwoMsgs {
    a: MS1;
    b: MS2;
}

contract MultiMsgContainer {
    field: TwoMsgs;

    init() {
        self.field = TwoMsgs{
            a: MS1{ foo:1 },
            b: MS2{ bar:2 }
        };
    }
}