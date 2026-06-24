struct MessageHolder {
    m: TestMessage;
}

message(0xAA) TestMessage {
    x: Int;
    y: Bool;
}

contract TestContract {
    mh: MessageHolder;
    init() {
        self.mh = MessageHolder{
            m: TestMessage{ x: 42, y: true }
        };
    }
}