contract TestContract {
    foo: Foo;

    init() {
        self.foo = Foo{
            bar: Bar{
                baz: Baz{
                    intVal: 42,
                    strVal: "nested",
                    optVal: null,
                },
                flag: true
            },
            name: "done"
        };
    }
}

struct Foo {
    bar: Bar;
    name: String;
}

struct Bar {
    baz: Baz;
    flag: Bool;
}

struct Baz {
    intVal: Int;
    strVal: String;
    optVal: Bool?;
}