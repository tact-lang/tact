message(0x77) DummyMsg {
    foo: Int;
}

contract OptMsg {
    m: DummyMsg?;

    init() {
        self.m = null;
    }
}