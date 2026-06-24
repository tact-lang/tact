contract StructOptionalMix {
    x: Int;
    y: Int?;
    foo: Foo;
    bar: Bar?;
    init() {
        self.x = 7;
        self.y = null;
        self.foo = Foo{ a:1, b:true };
        self.bar = null;
    }
}

struct Foo {
    a: Int;
    b: Bool;
}

struct Bar {
    s: String;
    i: Int;
}
