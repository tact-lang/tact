struct Bar {
    z: Int?;
}

struct Foo {
    y: Bar;
}

contract InitOrder {
    foo: Foo;
    bar: Bar;

    init() {
        self.bar = Bar{ z: 99 };
        self.foo = Foo{ y: self.bar };
    }
}