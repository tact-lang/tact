struct Foo {
    a: Int;
}

struct Bar {
    b: Foo;
}

struct Baz {
    c: Bar;
}

struct Qux {
    d: Baz;
}

contract DeepEmbed {
    q: Qux;
    init() {
        self.q = Qux{ d: Baz{ c: Bar{ b: Foo{ a: 123 } } } };
    }
}