message(0x12345678) StoredMsg {
    foo: Int;
    bar: String;
}

contract TestContract {
    msgData: StoredMsg;

    init() {
        self.msgData = StoredMsg{ foo: 42, bar: "hi" };
    }
}
