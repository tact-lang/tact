struct Foo {
    val: Int;
}

struct Bar {
    foo: Foo;
}

struct Baz {
    bar: Bar;
}

struct Qux {
    baz: Baz;
}

contract MultiNested {
    storage: Qux;

    init() {
        self.storage = Qux{
            baz: Baz{
                bar: Bar{
                    foo: Foo{
                        val: 99,
                    },
                },
            },
        };
    }
}
