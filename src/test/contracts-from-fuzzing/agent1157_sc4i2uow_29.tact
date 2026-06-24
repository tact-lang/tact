contract OptionDefaults {
    foo: Int? = 1;
    bar: String? = null;

    init() {
        self.foo = null;
        self.bar = "abc";
    }
}