struct MsgWrap {
    id: Int;
}

message TestMsg {
    wrap: MsgWrap;
}

contract MsgStructAsField {
    data: TestMsg;
    init() {
        self.data = TestMsg{wrap: MsgWrap{id:1}};
    }
}