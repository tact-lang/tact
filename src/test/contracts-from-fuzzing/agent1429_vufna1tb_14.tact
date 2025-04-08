contract MixOptionalsDefaults {
    foo: Int? = null;
    bar: Bool? = true;
    baz: String? = null;

    init() {
        self.foo = 12;
        self.bar = false;
        self.baz = "xx";
    }
}
