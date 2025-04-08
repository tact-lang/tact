struct Foo {
    a: Int;
}

struct Bar {
    b: Int;
}

contract TwoStructs {
    foo: Foo;
    bar: Bar;

    init() {
        self.foo = Foo{ a: 1 };
        self.bar = Bar{ b: 2 };
    }
}