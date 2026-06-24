struct MessageOpt {
    m: Msg?;
}

message(2) Msg {
    data: Int;
}

contract OptMsgStruct {
    mo: MessageOpt;

    init() {
        self.mo = MessageOpt{
            m: null
        };
    }
}