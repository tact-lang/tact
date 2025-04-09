contract OverlappingNames {
    foo: Int;
    Foo: Int;

    init() {
        self.foo = 1;
        self.Foo = 2;
    }
}