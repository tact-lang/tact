contract PartialDefaults {
    foo: Int;
    bar: String = "init";

    init() {
        self.foo = 123;
        self.bar = "override";
    }
}