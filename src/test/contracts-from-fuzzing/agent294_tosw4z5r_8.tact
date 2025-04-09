message(1) Msg {
    foo: Int;
}

contract MsgField {
    data: Msg;

    init() {
        self.data = Msg{ foo: 123 };
    }
}
