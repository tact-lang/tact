contract FieldsWithDefaults {
    foo: Int = 17;
    bar: Bool = true;
    name: String = "abc";

    init() {
        self.foo = 123;
        self.bar = false;
        self.name = "xyz";
    }
}