struct Foo {
    a: Int;
}

struct Bar {
    nested: Foo;
    optional: Int?;
}

struct Baz {
    s: Bar;
}

contract Test {
    storage: Baz;
    
    init() {
        self.storage = Baz{
            s: Bar{
                nested: Foo{ a: 12 },
                optional: null
            }
        };
    }
}
