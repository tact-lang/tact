struct MessageInStruct {
    m: InnerMsg;
    flag: Bool;
}

message(123) InnerMsg {
    x: Int;
}

contract MsgStruct {
    field: MessageInStruct;

    init() {
        self.field = MessageInStruct{
            m: InnerMsg{x: 5},
            flag: true
        };
    }
}
