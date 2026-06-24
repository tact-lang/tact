message Outer {
    inner: Inner;
}

message Inner {
    val: Int;
}

contract Test {
    receive(msg: Outer) {
        let x = msg.inner.val;
    }
}