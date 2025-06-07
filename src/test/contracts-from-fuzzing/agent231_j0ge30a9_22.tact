message HelloMsg {
    v: Int;
}

contract OptionalMsgPersist {
    m: HelloMsg?;

    init() {
        self.m = null;
    }
}