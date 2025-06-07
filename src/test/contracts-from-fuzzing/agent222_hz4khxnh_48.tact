contract InitNoDefaults {
    foo: Int;
    bar: String;
    baz: Bool;

    init() {
        self.foo = 42;
        self.bar = "hi";
        self.baz = true;
    }
}