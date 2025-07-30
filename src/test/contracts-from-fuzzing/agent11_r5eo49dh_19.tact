struct Container {
    s: Slice?;
}

message Wrapped {
    inner: Container;
}

contract Test {
    receive(message: Wrapped) {
        let x = message.inner;
        let y = Container{s: x.s};
    }
}