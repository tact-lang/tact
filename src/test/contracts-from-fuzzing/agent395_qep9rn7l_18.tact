message(0x1234) MsgType {
    value: Int = 55;
}

struct EmbedMsg {
    m: MsgType;
    text: String;
}

contract MsgInsideStorage {
    field: EmbedMsg;

    init() {
        self.field = EmbedMsg{
            m: MsgType{},
            text: "msg"
        };
    }
}
