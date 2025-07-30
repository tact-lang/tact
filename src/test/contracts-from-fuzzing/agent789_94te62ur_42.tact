contract OptionalsWithDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: Address? = null;
    qux: String? = null;
    qoo: Slice? = null;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
        self.qoo = null;
    }
}
