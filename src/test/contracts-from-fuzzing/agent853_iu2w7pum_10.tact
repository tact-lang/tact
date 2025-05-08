message(0x11112222) DummyMsg {
    foo: Int;
    bar: Bool;
}

contract MessageFieldTest {
    d: DummyMsg;

    init() {
        self.d = DummyMsg{foo:1, bar:true};
    }
}