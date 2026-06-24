contract OptionalReassign {
    foo: Int?;
    bar: String?;

    init() {
        self.foo = null;
        self.bar = "hello";
        self.foo = 123;
        self.bar = null;
    }
}