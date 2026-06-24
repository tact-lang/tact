message Outer {
    inner: Inner;
}

message Inner {
    data: Int;
}

contract Test {
    receive(msg: Outer) {
        // nested message type param
    }
}