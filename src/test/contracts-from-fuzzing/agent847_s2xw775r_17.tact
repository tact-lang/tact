struct MsgInner {
    x: Int;
}

message(10) TestMsg {
    inner: MsgInner;
}

contract MsgTypeFieldPersistent {
    val: TestMsg;

    init() {
        self.val = TestMsg{ inner: MsgInner{ x: 100 } };
    }
}