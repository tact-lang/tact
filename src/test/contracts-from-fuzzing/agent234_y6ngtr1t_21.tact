// Trying null as default for persistent optional variables
contract NullDefaults {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
    }
}