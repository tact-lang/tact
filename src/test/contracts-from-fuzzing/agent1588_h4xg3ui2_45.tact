message FilledMsg {
    foo: Int;
    bar: Bool;
}

contract OptMsgPersist {
    m: FilledMsg?;
    init() {
        self.m = null;
    }
}