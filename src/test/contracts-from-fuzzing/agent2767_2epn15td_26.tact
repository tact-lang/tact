struct Foo {
    x: Int;
}

struct Bar {
    foo: Foo;
}

contract MultiAssignDefault {
    bar: Bar = Bar{ foo: Foo{ x: 42 } };
}