struct Inner {
    z: Int;
}

struct Outer {
    inner: Inner;
}

message Msg {
    outer: Outer;
}

contract Test {
    receive(msg: Msg) {
        let tmp = msg.outer.inner.z;
    }
}