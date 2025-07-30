struct Foo {
    f: Int;
}

struct Bar {
    foo: Foo;
    b: Int;
}

struct Baz {
    bar: Bar;
    z: Int;
}

contract MultiLevel {
    s: Baz;

    init() {
        self.s = Baz{
            bar: Bar{
                foo: Foo{ f:5 },
                b:6
            },
            z:7
        };
    }
}