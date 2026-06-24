contract MixedFields {
    foo: Int = 1;
    bar: Bool;
    baz: String?;
    init() {
        self.bar = false;
        self.baz = null;
    }
}