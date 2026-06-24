message(0x42) SampleMsg {
    foo: Int;
}

struct MsgContainer {
    nested: SampleMsg?;
    x: Int;
}

contract OptMsgStorage {
    stored: MsgContainer;

    init() {
        self.stored = MsgContainer{
            nested: null,
            x: 11,
        };
    }
}