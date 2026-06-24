message Outer {
    inner: Inner;
}

struct Inner {
    x: Int;
}

contract Test {
    receive(msg: Outer) {
        let k = msg.inner.x;
    }
}