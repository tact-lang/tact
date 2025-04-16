message(0x42) Msg {
    foo: Int;
    bar: String;
}

contract PersistentMessageField {
    msgState: Msg;

    init() {
        self.msgState = Msg{ foo: 7, bar: "hi" };
    }
}
