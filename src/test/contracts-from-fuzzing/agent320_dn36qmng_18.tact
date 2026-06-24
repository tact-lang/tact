contract OptionalDeep {
    foo: Int?;
    bar: Int;

    init() {
        self.foo = null;
        self.bar = 22;
    }
}