message(123) Msg {
    foo: Int;
    bar: String?;
}

contract OptionalMsgField {
    msgData: Msg?;

    init() {
        self.msgData = null;
    }
}
