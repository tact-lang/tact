message(0xABCD1234) MsgData {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    stored: MsgData?;

    init() {
        self.stored = MsgData{ foo: 123, bar: true };
    }
}