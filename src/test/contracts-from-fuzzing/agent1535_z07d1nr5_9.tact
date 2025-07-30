message(0x5678) SomeMsg {
    foo: Int;
}

contract OptMsgPersist {
    stored: SomeMsg? = null;
    init() {
        self.stored = SomeMsg{ foo: 99 };
    }
}
