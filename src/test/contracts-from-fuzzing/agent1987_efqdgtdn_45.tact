struct HasOptionalMsg {
    m: Msg?;
}

message(0x77) Msg {
    f: Int;
}

contract OptionalMsgField {
    data: HasOptionalMsg;
    init() {
        self.data = HasOptionalMsg{m: Msg{f:1}};
    }
}