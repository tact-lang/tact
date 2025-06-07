struct Bar {
    foo: Foo;
}

contract Test {
    receive() {
        let b = Bar{ foo: Foo{ x: 1 } };
    }
}

struct Foo {
    x: Int;
}