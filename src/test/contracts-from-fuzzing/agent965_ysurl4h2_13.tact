contract MixedOptionalDefaults {
    foo: Int = 1;
    bar: Int?;
    baz: Bool = false;
    qux: String?;

    init() {
        self.bar = 2;
        self.qux = "str";
    }
}