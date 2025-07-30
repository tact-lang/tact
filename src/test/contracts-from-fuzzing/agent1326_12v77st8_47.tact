struct Foo {
    a: Int?;
}

contract NullableFoo {
    foo: Foo?;
    init() {
        self.foo = Foo{a: null};
    }
}