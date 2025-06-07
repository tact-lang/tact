struct MessageInner {
    s: String;
}

message(42) MyMsg {
    field: MessageInner;
}

contract InsideMessages {
    lastMsg: MyMsg;
    init() {
        self.lastMsg = MyMsg { field: MessageInner{ s:"hello" } };
    }
}
