
struct InnerStruct {
    a: Int;
}

message OuterMessage {
    inner: InnerStruct;
}

contract TestContract {
    receive(msg: OuterMessage) {
        let value = msg.inner.a;
    }
}
