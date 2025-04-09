message(101) InnerMsg {
    data: Int;
}

message(102) OuterMsg {
    inner: InnerMsg;
    flag: Bool;
}

contract MsgInMsg {
    msg: OuterMsg;

    init() {
        self.msg = OuterMsg{inner: InnerMsg{data: 42}, flag: true};
    }
}