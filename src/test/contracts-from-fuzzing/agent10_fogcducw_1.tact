
struct Outer {
    inner: Inner;
}

struct Inner {
    value: Int;
}

message OuterMessage {
    outer: Outer;
}

contract TestContract {
    receive(msg: OuterMessage) {
        let value = msg.outer.inner.value;
    }
}
