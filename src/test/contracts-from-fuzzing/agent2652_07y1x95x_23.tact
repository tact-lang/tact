contract OptionalShadow {
    foo: Int?;

    init() {
        self.foo = 12;
        self.foo = null;
    }
}