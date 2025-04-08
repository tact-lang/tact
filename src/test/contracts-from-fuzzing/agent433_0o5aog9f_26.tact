struct Foo {
    x: Int;
}

struct Bar {
    foo: Foo;
}

struct Baz {
    bar: Bar;
}

struct Quux {
    baz: Baz;
}

contract TestContract {
    quux: Quux;

    init() {
        self.quux = Quux{
            baz: Baz{
                bar: Bar{
                    foo: Foo{
                        x: 5,
                    },
                },
            },
        };
    }
}