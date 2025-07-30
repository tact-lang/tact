struct Foo {
    bar: Bar;
}

struct Bar {
    baz: Bool;
}

contract Test {
    foo: Foo;

    init() {
        self.foo = Foo{ bar: Bar{ baz: true } };
    }
}