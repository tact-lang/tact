message(0x12345678) SomeMsg {
    foo: Int;
    bar: String?;
}

contract OptMsgStorage {
    msgOpt: SomeMsg?;

    init() {
        self.msgOpt = SomeMsg{ foo: 99, bar: null };
    }
}