struct ContainsMessage {
    m: Msg;
}

message(0x11111111) Msg {
    x: Int;
}

contract StructWithMsgField {
    data: ContainsMessage;

    init() {
        self.data = ContainsMessage{
            m: Msg{
                x: 17
            }
        };
    }
}