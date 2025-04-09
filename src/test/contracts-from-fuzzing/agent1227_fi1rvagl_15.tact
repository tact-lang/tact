message(42) MsgA { foo: Int }

struct InnerWithMsg {
    bar: MsgA;
    v: Int;
}

contract MsgStruct {
    myval: InnerWithMsg;
    init() {
        self.myval = InnerWithMsg {
            bar: MsgA { foo: 7 },
            v: 2
        };
    }
}
