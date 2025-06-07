message Bar {
    foo: Foo;
}

contract Test {
    receive(msg: Bar) {
        let x = msg.foo.x;
    }
}

message Foo {
    x: Int;
}