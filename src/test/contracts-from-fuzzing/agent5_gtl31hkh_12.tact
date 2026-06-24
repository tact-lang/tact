// Attempt invalid: nested message
message InnerMsg {
    a: Int;
}

message OuterMsg {
    inner: InnerMsg;
}

contract Test {
    receive(msg: OuterMsg) {
        let a = msg.inner.a;
    }
}