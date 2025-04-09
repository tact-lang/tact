message NestedMessage {
    inner: Payment;
}

message Payment {
    amount: Int;
}

contract Test {
    receive(msg: NestedMessage) {
        let v = msg.inner.amount;
    }
}