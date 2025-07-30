contract EmptyInitOnly {
    foo: Int;
    bar: String;
    baz: Bool;
    init() {
        self.foo = 1;
        self.bar = "test";
        self.baz = false;
    }
}