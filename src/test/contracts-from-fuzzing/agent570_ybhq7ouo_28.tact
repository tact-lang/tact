message(777) FooMsg {
    foo: Int;
    text: String;
}

contract MessageFieldContract {
    stored: FooMsg;

    init() {
        self.stored = FooMsg{
            foo: 42,
            text: "msg"
        };
    }

    receive() {}
}