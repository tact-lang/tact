message InnerMessage {
    value: Int;
}

message OuterMessage {
    inner: InnerMessage;
}

contract MyContract {
    receive(msg: OuterMessage) {
        let x = msg.inner.value;
    }
}
