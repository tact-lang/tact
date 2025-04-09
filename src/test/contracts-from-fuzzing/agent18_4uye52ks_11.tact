struct Inner {
    value: Int;
}

message MyMessage {
    inner: Inner;
}

contract TestContract {
    receive(msg: MyMessage) {
        let val = msg.inner.value;
    }
}