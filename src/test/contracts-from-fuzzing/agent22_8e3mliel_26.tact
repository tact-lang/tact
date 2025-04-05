message InnerReceived {}

message Outer {
    inner: InnerReceived;
}

contract Test {
    receive(msg: Outer) {
        let _ = msg.inner;
    }
}