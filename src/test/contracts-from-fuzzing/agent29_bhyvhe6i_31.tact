message Foo {}

message Bar {
    foo: Foo;
}

message Baz {
    bar: Bar;
}

contract TestContract {
    receive(b: Baz) {
        let someFoo = b.bar.foo;
    }
}