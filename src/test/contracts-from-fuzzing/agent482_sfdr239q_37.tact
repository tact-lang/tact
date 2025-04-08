message(0x33334444) OptMsg {
    foo: Int;
}

contract OptionalMsgPersist {
    optM: OptMsg? = null;

    init() {
        self.optM = null;
    }
}
