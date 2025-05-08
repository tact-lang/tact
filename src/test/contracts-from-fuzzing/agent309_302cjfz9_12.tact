struct Foo {
    a: Int;
}

struct Bar {
    b: Int;
    f: Foo;
}

contract StructSwapOrder {
    bar: Bar;
    foo: Foo;

    init() {
        self.foo = Foo{ a: 5 };
        self.bar = Bar{ b: 10, f: self.foo };
    }
}