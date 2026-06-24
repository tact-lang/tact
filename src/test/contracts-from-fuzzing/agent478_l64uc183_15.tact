struct EmbedOptMsg {
    m: MessageType?;
}

message(0x1234abcd) MessageType {
    foo: Int;
}

contract NestedOptMsgField {
    data: EmbedOptMsg = EmbedOptMsg{
        m: null
    };
}