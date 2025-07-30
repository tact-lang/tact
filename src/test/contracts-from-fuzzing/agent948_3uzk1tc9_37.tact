contract OverlappingDefaults {
    foo: Int = 0;
    bar: Int;

    init() {
        self.bar = 42;
        self.foo = 99;
    }
}