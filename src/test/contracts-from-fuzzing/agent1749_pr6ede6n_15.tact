contract OptionalAndDefaults {
    foo: Int? = null;
    bar: String = "bar";
    baz: Bool?;
    qux: Address;

    init() {
        self.baz = true;
        self.qux = myAddress();
    }
}