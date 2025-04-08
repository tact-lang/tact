contract NoDefaults {
    foo: Int;
    bar: String;

    init() {
        self.foo = 10;
        self.bar = "abc";
    }
}