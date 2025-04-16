contract MixedMsgs {
    data: Container;

    init() {
        self.data = Container{
            num: 11,
            msg: MsgOne{ val: 22 },
            optMsg: null
        };
    }
}

struct Container {
    num: Int;
    msg: MsgOne;
    optMsg: MsgTwo?;
}

message(0x1111) MsgOne {
    val: Int;
}

message(0x2222) MsgTwo {
    x: Int;
}
