message NestedMessage {
    inner: InnerMessage;
}

message InnerMessage {
    value: Int;
}

contract TestContract {
    receive(msg: NestedMessage) {
        let v = msg.inner.value;
    }
}