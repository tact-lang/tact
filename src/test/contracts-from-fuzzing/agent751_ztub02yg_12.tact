message(0x12345678) InnerMessage {
    count: Int;
}

struct WrapMsg {
    m: InnerMessage;
    note: String;
}

contract MessageInStructStorage {
    data: WrapMsg;

    init() {
        self.data = WrapMsg{
            m: InnerMessage{count: 1},
            note: "ok"
        };
    }
}