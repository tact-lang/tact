contract DefaultOptionalFields {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
    }
}