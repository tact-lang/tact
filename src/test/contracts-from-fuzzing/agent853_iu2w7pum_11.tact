message(0x33334444) DummyMsgOpt {
    foo: Int;
}

contract MessageOptional {
    opt: DummyMsgOpt?;

    init() {
        self.opt = null;
    }
}