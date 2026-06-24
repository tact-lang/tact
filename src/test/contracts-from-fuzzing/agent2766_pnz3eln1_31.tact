message(0x1234) TestMessage {
    foo: Int;
}

contract MessageFieldContract {
    val: TestMessage;

    init() {
        self.val = TestMessage{ foo: 99 };
    }
}