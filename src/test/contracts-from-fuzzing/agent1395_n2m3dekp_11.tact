contract OverlappingOptionals {
    foo: Int?;
    Foo: Int?;

    init() {
        self.foo = null;
        self.Foo = 42;
    }
}