struct Inner {
    foo: Int;
}

message Msg {
    bar: Inner;
}

contract Test {
    receive(msg: Msg) {
        let x = msg.bar.foo;
    }
}