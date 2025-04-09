contract OptionalWithDefaultVariant {
    foo: Int? = null;
    bar: String?;

    init() {
        self.foo = null;
        self.bar = null;
    }
}