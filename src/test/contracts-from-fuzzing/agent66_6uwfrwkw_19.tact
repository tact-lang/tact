contract OptionalBool {
    foo: Bool?;
    bar: Bool?;

    init() {
        self.foo = null;
        self.bar = true;
    }
}