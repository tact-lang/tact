message(100) TestMsg {
    foo: Int;
    bar: Bool;
    baz: String?;
}

contract MessageFieldTest {
    saved: TestMsg = TestMsg{
        foo: 1,
        bar: true,
        baz: null,
    };

    init() {
        self.saved = self.saved;
    }
}