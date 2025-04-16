message(777) MsgTest {
    foo: Int;
    bar: Bool;
}

contract MessageAsPersistent {
    m: MsgTest;
    init() {
        self.m = MsgTest{foo: 42, bar: true};
    }
}