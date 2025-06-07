message InnerMessage {
    value: Int;
}

message OuterMessage {
    inner: InnerMessage;
}

contract TestContract {
    receive(msg: OuterMessage) {
        let x = msg.inner.value;
    }
}
