struct InnerStruct {
    a: Int;
}

message OuterMessage {
    inner: InnerStruct;
}

contract TestContract {
    receive(msg: OuterMessage) {
        let innerA: Int = msg.inner.a;
    }
}
