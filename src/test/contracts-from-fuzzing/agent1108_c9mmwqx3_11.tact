struct Foo {
    a: Int?;
}

struct Bar {
    b: Bool?;
}

contract TestContract {
    foo: Foo;
    bar: Bar;

    init() {
        self.foo = Foo{ a: 42 };
        self.bar = Bar{ b: true };
    }
}