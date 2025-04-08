contract NullableDefaultFields {
    foo: Int? = null;
    bar: Bool? = null;

    init() {
        self.foo = null;
        self.bar = null;
    }
}