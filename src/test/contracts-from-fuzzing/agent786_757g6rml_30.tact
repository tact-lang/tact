struct Foo {
    a: Int;
    b: Bool;
    c: String;
}

struct Bar {
    f: Foo;
    d: Int;
}

struct Baz {
    r: Bar;
    s: Foo;
}

contract NestedMulti {
    v: Baz;

    init() {
        self.v = Baz{
            r: Bar{
                f: Foo{ a:1, b:true, c:"x" },
                d: 42
            },
            s: Foo{ a:2, b:false, c:"y" }
        };
    }
}