contract OptDefaults {
    foo: Int?;
    bar: String? = "default";

    init() {
        self.foo = 1;
        self.bar = null;
    }
}
