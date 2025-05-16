struct Inner {
    foo: Int
}

message Outer {
    inner: Inner
}

contract Test {
    receive(msg: Outer) {
        let x = msg.inner.foo;
    }
}