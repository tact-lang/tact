struct Foo {
    bar: Bar;
}

struct Bar {
    baz: Baz;
}

struct Baz {
    quux: Quux;
}

struct Quux {
    x: Int;
}

contract VeryDeep {
    deep: Foo;

    init() {
        self.deep = Foo{ bar: Bar{ baz: Baz{ quux: Quux{ x: 123 } } } };
    }
}