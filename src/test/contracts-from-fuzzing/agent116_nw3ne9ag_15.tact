contract StructWithStringDefault {
    foo: Foo;

    init() {
        self.foo = Foo{ x: 10 };
    }
}

struct Foo {
    s: String = "Hello";
    x: Int;
}
