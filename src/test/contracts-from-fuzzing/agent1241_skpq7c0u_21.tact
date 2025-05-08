struct MessageHolder {
    m: HelloMsg;
}

message(0x42) HelloMsg {
    content: String;
}

contract StoreMsgInStruct {
    data: MessageHolder;

    init() {
        self.data = MessageHolder{
            m: HelloMsg{ content: "hi" }
        };
    }
}
