struct MessageInner {
    foo: Int;
}

message WrappedMessage {
    bar: MessageInner;
}

contract MsgStructTest {
    m: WrappedMessage;

    init() {
        self.m = WrappedMessage{ bar: MessageInner{foo:23} };
    }
}