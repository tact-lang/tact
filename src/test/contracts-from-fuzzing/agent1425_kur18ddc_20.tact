struct Foo {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Slice?;
}

contract OptionalDefault {
    foo: Foo;

    init() {
        self.foo = Foo{};
    }

    receive() {}
}