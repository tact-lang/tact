struct MessageInner {
    info: String;
}

message(0x42) MyMsg {
    payload: MessageInner;
}

contract MessageField {
    msgfield: MyMsg;

    init() {
        self.msgfield = MyMsg{ payload: MessageInner{ info: "hi" } };
    }
}