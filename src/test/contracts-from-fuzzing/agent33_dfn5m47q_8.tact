struct Foo {
    a: Int;
    b: Bool?;
    c: Bar;
}

struct Bar {
    d: Int?;
    e: Bool;
    f: Baz;
}

struct Baz {
    g: Int;
    h: Bool?;
}

contract Complex {
    val: Foo;

    init() {
        self.val = Foo{
            a: 10,
            b: null,
            c: Bar{
                d: null,
                e: true,
                f: Baz{
                    g: 99,
                    h: false
                }
            }
        };
    }
}