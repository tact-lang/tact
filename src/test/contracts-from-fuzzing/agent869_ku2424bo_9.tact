struct Foo {
    a: Int;
}

struct Bar {
    foo: Foo;
    b: Int;
}

struct Baz {
    bar: Bar;
    c: Foo;
    d: Int;
}

contract DeepChain {
    baz: Baz;

    init() {
        self.baz = Baz{
            bar: Bar{
                foo: Foo{ a: 1 },
                b: 2,
            },
            c: Foo{ a: 3 },
            d: 4,
        };
    }

    receive() {}
}
