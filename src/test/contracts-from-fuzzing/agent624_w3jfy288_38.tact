message(1) InnerMsg {
    foo: Int;
}

message(2) OuterMsg {
    inner: InnerMsg?;
}

contract MsgInMsgOpt {
    payload: OuterMsg;

    init() {
        self.payload = OuterMsg{
            inner: null
        };
    }
}