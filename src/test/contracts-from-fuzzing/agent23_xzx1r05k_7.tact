message Inner {
    y: Int;
}

message Outer {
    inner: Inner;
}

contract Test {
    receive(msg: Outer) {
        let z = msg.inner.y + 1;
    }
}