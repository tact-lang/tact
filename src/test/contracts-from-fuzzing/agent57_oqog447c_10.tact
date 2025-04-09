message Outer {
    inner: Inner;
}

message Inner {
    amount: Int;
}

contract Test {
    receive(msg: Outer) {
        let x = msg.inner.amount;
    }
}