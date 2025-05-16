message(0x1234) MsgType {
    foo: Int
}

struct WrapMsg {
    inner: MsgType
}

contract TestContract {
    stored: WrapMsg;

    init() {
        self.stored = WrapMsg{ inner: MsgType{ foo: 77 } };
    }

    receive() {}
}