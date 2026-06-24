
struct Inner {
    a: Int;
}

message Outer {
    inner: Inner;
}

contract TestContract {
    receive(msg: Outer) {
        let x = msg.inner.a;
    }
}
