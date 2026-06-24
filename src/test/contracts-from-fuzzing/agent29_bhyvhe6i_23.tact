message Foo {
    a: Int;
}

message Bar {
    foo: Foo;
}

fun makeBar(): Bar {
    return Bar { foo: Foo { a: 7 } };
}

contract Test {
    receive() {
        let bar = makeBar();
    }
}