struct Foo {
    x: Int;
    y: Bar;
}

struct Bar {
    a: Int;
    b: Baz;
}

struct Baz {
    s: String;
    f: Bool;
}

contract NestedDifferentTypes {
    data: Foo;

    init() {
        self.data = Foo{
            x: 1,
            y: Bar{
                a: 2,
                b: Baz{
                    s: "ok",
                    f: true
                }
            }
        };
    }
}