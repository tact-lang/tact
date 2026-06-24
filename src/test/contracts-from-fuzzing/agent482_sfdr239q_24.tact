message(0x12345678) Contained {
    value: Int;
}

struct MsgHolder {
    maybeMsg: Contained?;
    count: Int;
}

contract OptMsgPersist {
    dat: MsgHolder;

    init() {
        self.dat = MsgHolder{
            maybeMsg: null,
            count: 99
        };
    }
}
