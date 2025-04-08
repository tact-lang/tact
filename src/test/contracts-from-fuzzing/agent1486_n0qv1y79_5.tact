message(0x12345678) MsgType {
    foo: Int;
    bar: String?;
}

contract MessageInStorage {
    stored: MsgType;

    init() {
        self.stored = MsgType{
            foo: 100,
            bar: null,
        };
    }
}