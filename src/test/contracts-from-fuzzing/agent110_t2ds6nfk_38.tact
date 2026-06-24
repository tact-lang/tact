struct Foo {
    bar: String?;
    baz: Bool = true;
}

contract DefOpt {
    s: Foo;
    init() {
        self.s = Foo{};
    }
}