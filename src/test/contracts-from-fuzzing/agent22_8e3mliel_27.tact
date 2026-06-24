message Outer {
    inner: Inner;
}

message Inner {
    foo: Int;
}

contract Test {
    receive(msg: Outer) {
        let x = msg.inner.foo;
    }
}