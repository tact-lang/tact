contract OptionalDefaults {
    foo: Int? = 5;
    bar: String? = "str";

    init() {
        self.foo = null;
        self.bar = null;
    }
}
