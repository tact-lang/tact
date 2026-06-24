contract TestContract {
    foo: Foo;

    init() {
        self.foo = Foo { bar: 7, baz: null };
    }
}

struct Foo {
    bar: Int;
    baz: String?;
}