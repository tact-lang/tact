struct MessageInner {
    x: Int;
}

message(0xAAA) TestMsg {
    inner: MessageInner;
}

contract UsesMessage {
    data: TestMsg;

    init() {
        self.data = TestMsg{
            inner: MessageInner{
                x: 10
            }
        };
    }
}