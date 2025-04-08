struct MessageWrap {
    foo: Int;
}

message(33) JustMsg {
    bar: Int;
}

contract MsgField {
    m: JustMsg;
    s: MessageWrap;

    init() {
        self.m = JustMsg{bar:42};
        self.s = MessageWrap{foo:7};
    }
}