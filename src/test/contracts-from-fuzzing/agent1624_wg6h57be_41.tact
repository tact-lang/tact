message(42) OptMsg {
    foo: Int;
}

contract OptMsgVariable {
    msgOpt: OptMsg?;

    init() {
        self.msgOpt = null;
    }
}