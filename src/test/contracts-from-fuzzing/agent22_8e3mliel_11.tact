message OuterMsg {
    inner: InnerMsg;
}

message InnerMsg {
    foo: Int;
}

contract Test {
    receive(msg: OuterMsg) {
        let x = msg.inner.foo;
    }
}