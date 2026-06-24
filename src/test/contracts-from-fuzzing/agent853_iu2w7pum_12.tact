message(2222) InnerMsg {
    mval: Int;
}

struct WrapMsg {
    msg: InnerMsg;
    foo: Int;
}

contract MsgInStruct {
    v: WrapMsg;

    init() {
        self.v = WrapMsg{
            msg: InnerMsg{mval:9},
            foo: 6,
        };
    }
}