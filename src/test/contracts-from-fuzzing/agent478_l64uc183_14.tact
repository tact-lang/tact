struct EmbedMsg {
    m: MessageType;
}

message(0x12345678) MessageType {
    x: Int;
    y: Bool;
}

contract NestedMsgField {
    data: EmbedMsg = EmbedMsg{
        m: MessageType{ x: 0, y: true }
    };
}