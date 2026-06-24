message(0x42) Msg {
    foo: Int;
}

contract PersistMsgStruct {
    m: Msg;

    init() {
        self.m = Msg{ foo: 21 };
    }
}