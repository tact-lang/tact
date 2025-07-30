contract LargeAndOptional {
    foo: Int = 1;
    bar: Int?;
    baz: String?;
    qux: Bool?;
    init() {
        self.bar = null;
        self.baz = null;
        self.qux = true;
    }
}