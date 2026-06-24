struct EmbedMessage {
    m: Msg;
    flag: Bool;
}

message(1) Msg {
    x: Int;
}

contract MessageInStruct {
    val: EmbedMessage;
    init() {
        self.val = EmbedMessage{
            m: Msg{ x: 5 },
            flag: true,
        };
    }
}
