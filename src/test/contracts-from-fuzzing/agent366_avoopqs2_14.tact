struct Foo {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultsNullOpt {
    foo: Foo;
    init() {
        self.foo = Foo{};
    }
}