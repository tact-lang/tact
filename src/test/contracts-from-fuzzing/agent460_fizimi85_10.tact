message(0x12345678) InfoMsg {
    v: Int;
    s: String;
}

contract OptionalMsgStored {
    optmsg: InfoMsg?;

    init() {
        self.optmsg = InfoMsg{
            v: 99,
            s: "hello",
        };
    }
}