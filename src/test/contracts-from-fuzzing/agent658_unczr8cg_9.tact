struct MessageHolder {
    m: Msg;
}

message(1) Msg {
    n: Int;
}

contract StructWithMsgField {
    data: MessageHolder;

    init() {
        self.data = MessageHolder{
            m: Msg{n: 123}
        };
    }
}