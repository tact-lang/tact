struct Foo {
    x: Int;
}

struct Bar {
    foo: Foo;
}

contract OutOfOrderAssignment {
    data: Bar;

    init() {
        let f = Foo{ x: 7 };
        self.data = Bar{ foo: f };
    }
}