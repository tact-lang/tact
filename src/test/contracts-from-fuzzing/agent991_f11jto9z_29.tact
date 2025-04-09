message(0x99) MMsg {
    a: Int;
}

contract OptMsgPersist {
    m: MMsg?;

    init() {
        self.m = null;
    }
}