message(42) Msg {
    foo: Int;
}

struct WrapMsg {
    m: Msg;
}

contract MsgStorageTest {
    inner: WrapMsg;

    init() {
        self.inner = WrapMsg{ m: Msg{ foo: 123 } };
    }
}