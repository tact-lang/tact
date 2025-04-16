struct MessageHolder {
    m: MsgTest;
}

message(12345) MsgTest {
    a: Int;
}

contract MessageInStruct {
    holder: MessageHolder;

    init() {
        self.holder = MessageHolder{
            m: MsgTest{ a: 42 }
        };
    }
}